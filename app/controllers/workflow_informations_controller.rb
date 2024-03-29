# encoding: UTF-8
class WorkflowInformationsController < ApplicationController
    WORKFLOW_INFO_INIT = 1
    WORKFLOW_INFO_PUBLISH = 2
    WORKFLOW_INFO_EDITING = 3
    before_action :authenticate_user!

    def new
        
    end

    def create
        @workflow_information = WorkflowInformation.create(all_params)
        @workflow_information.status = WORKFLOW_INFO_INIT
        @workflow_information.author = current_user
        @workflow_information.last_editor = current_user
        @workflow_information.save

        @workflow_privilege = WorkflowPrivilege.create
        @workflow_privilege.default_department
        @workflow_privilege.workflow_information = @workflow_information
        @workflow_privilege.save
        #@workflow_information.save
        #redirect_to @workflow_information
        redirect_to edit_workflow_information_path(@workflow_information.id)
    end

require 'nokogiri'
=begin
GraphNode.incomings, Array of STRING(SequenceFlow ID)
GraphNode.outgoings, Array of STRING(SequenceFlow ID)
=end
    GraphNode = Struct.new :id_str, :name, :type, :incomings, :outgoings
    GraphEdge = Struct.new :id_str, :name, :source, :target, :event_type

    def edit
        @workflow_information = WorkflowInformation.find(params[:id])
        @workflow_information_id = params[:id]
        if @workflow_information.xml != nil
            @nodes, @edges = parseBpmn(@workflow_information.xml)
        else
            @nodes = nil
            @edges = nil
        end
        if @workflow_information.status == WORKFLOW_INFO_PUBLISH
            workflow_information_hash = @workflow_information.attributes
            workflow_information_hash.delete("id")
            @new_workflow_information = WorkflowInformation.create(workflow_information_hash)
            @new_workflow_information.status = WORKFLOW_INFO_EDITING
            @new_workflow_information.last_editor = current_user
            @new_workflow_information.save

            # TODO change the pricilege copy
            @new_workflow_privilege = WorkflowPrivilege.create
            @new_workflow_privilege.edit_department = @workflow_information.workflow_privilege.edit_department
            @new_workflow_privilege.execute_department = @workflow_information.workflow_privilege.execute_department
            @new_workflow_privilege.delete_department = @workflow_information.workflow_privilege.delete_department
            @new_workflow_privilege.workflow_information = @new_workflow_information
            @new_workflow_privilege.save

            @workflow_information.workflow_information_and_tags.each do |tag|
                workflow_information_and_tag = WorkflowInformationAndTag.create
                workflow_information_and_tag.workflow_information = @new_workflow_information
                workflow_information_and_tag.workflow_tag = tag.workflow_tag
                workflow_information_and_tag.save
            end
            # TODO redirect_to last version
            redirect_to edit_workflow_information_path(@new_workflow_information.id)
        end

        @categories = WorkflowCategory.all.collect{|t| [t.name, t.id]}
        @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}
        @active_page = params[:active_page] == nil ? "info" : params[:active_page]
        @workflow_tag_str = ""
        @workflow_information.workflow_tags.each do |tag|
            @workflow_tag_str = @workflow_tag_str + tag.name + ","
        end
        @execute_department_choice = @workflow_information.workflow_privilege == nil ? 1 : @workflow_information.workflow_privilege.execute_department_id
        @edit_department_choice = @workflow_information.workflow_privilege == nil ? 1 : @workflow_information.workflow_privilege.edit_department_id
        @delete_department_choice = @workflow_information.workflow_privilege == nil ? 1 : @workflow_information.workflow_privilege.delete_department_id
    end

    def update
        @workflow_information = WorkflowInformation.find(params[:id])
        case params[:commit]
        when "Save Information"
            @active_page = "diagram"

            # delete origin tags
            origin_tags = @workflow_information.workflow_information_and_tags.all
            origin_tags.each do |origin_tag|
                origin_tag.destroy
            end

            # deal with tag
            @all_tag_str = tag_params[:workflow_tag][:name]
            @all_tag_list = @all_tag_str.split(',')
            @all_tag_list.each do |tag|
                workflow_tag = WorkflowTag.where(name: tag).first
                if workflow_tag == nil
                    workflow_tag = WorkflowTag.create(:name => tag)
                end
                workflow_information_and_tag = WorkflowInformationAndTag.create
                workflow_information_and_tag.workflow_information = @workflow_information
                workflow_information_and_tag.workflow_tag = workflow_tag
                workflow_information_and_tag.save
            end

            wiki_page_id = wiki_params[:wiki_and_workflow_information][:wiki_page_id]
            wiki_and_workflow_information = WikiAndWorkflowInformation.where(:wiki_page_id => wiki_page_id, :workflow_information_id=> @workflow_information.id).first
            if wiki_and_workflow_information == nil
                WikiAndWorkflowInformation.create(:wiki_page_id => wiki_page_id, :workflow_information_id => @workflow_information.id)
            else
                wiki_and_workflow_information.destroy
                WikiAndWorkflowInformation.create(:wiki_page_id => wiki_page_id, :workflow_information_id => @workflow_information.id)
            end

            if @workflow_information.update(all_params)
                redirect_to edit_workflow_information_path(@workflow_information.id, :active_page => @active_page)
            else
                render 'edit'
            end
        when "Save Diagram"
            @active_page = "jurisdiction"
            redirect_to edit_workflow_information_path(@workflow_information.id, :active_page => @active_page)

        when "Save Authorization"
            @active_page = "version"
            @workflow_privilege = @workflow_information.workflow_privilege
            if @workflow_privilege.update(workflow_privilege_params[:workflow_privilege])
                @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}
                redirect_to edit_workflow_information_path(@workflow_information.id, :active_page => @active_page)
            else
                render 'edit'
            end
        when "Publish"
            if @workflow_information.status == WORKFLOW_INFO_INIT
                if @workflow_information.update(version_params)
                    @workflow_information.status = WORKFLOW_INFO_PUBLISH
                    @workflow_information.save
                    redirect_to workflow_information_path(@workflow_information.id)
                else
                    render 'edit'
                end
            else
                if @workflow_information.update(version_params)
                    @workflow_information.status = WORKFLOW_INFO_PUBLISH
                    @workflow_information.save
                    # TODO 关联父节点, connect to parent workflow_informations
                    redirect_to workflow_information_path(@workflow_information.id)
                else
                    render 'edit'
                end
            end
        else
            redirect_to workflow_information_path(@workflow_information.id)
        end

    end

    def show
        @workflow_information = WorkflowInformation.find(params[:id])
        @workflow_information_id = params[:id]
        if @workflow_information.xml != nil
            @nodes, @edges = parseBpmn(@workflow_information.xml)
        else
            @nodes = nil
            @edges = nil
        end

        @active_page = params[:active_page] == nil ? "preview" : params[:active_page]
        @version_workflow_informations = WorkflowInformation.where(:name => @workflow_information.name, :status => WORKFLOW_INFO_PUBLISH)
        @process_informations = ProcessInformation.where(:workflow_information_id => @workflow_information.id)
    end


    def destroy
        @workflow_information = WorkflowInformation.find(params[:id])
        @workflow_information.destroy
        redirect_to root_path
    end

    private
    def all_params
        params.require(:workflow_information).permit(:name, :introduction, :detial_description, :version_name, :category_id, :tag, :author, :last_editor, :status, :createtime)
    end

    def info_params
        params.require(:workflow_information).permit(:name, :introduction, :detial_description, :version_name, :category, :tag)
    end

    def workflow_privilege_params
        params.require(:workflow_information).permit(:workflow_information_id, workflow_privilege: [:edit_department_id, :execute_department_id, :delete_department_id])
    end

    def version_params
        params.require(:workflow_information).permit(:name, :introduction, :detial_description, :version_name, :category, :tag)
    end

    def tag_params
        params.require(:workflow_information).permit(workflow_tag: [:name])
    end

    def wiki_params
        params.require(:workflow_information).permit(wiki_and_workflow_information:[:wiki_page_id])
    end
    def parseBpmn(xml)
        nodes = Array.new
        edges = Array.new

        doc = Nokogiri::XML.parse(xml)

        doc.xpath('//bpmn2:process').children.each do |element|
            id = element["id"]
            if id != nil
                name = element["name"]
                type = element.name
                if type == "sequenceFlow"
                    source = element["sourceRef"]
                    target = element["targetRef"]
                    #event_type = element["magic:event-type"]
                    edges.push(GraphEdge.new id, name, source, target, nil)
                else
                    incomings = Array.new
                    outgoings = Array.new
                    element.xpath('bpmn2:incoming').each do |incoming|
                        incomings.push(incoming.text)
                    end
                    element.xpath('bpmn2:outgoing').each do |outgoing|
                        outgoings.push(outgoing.text)
                    end
                    nodes.push(GraphNode.new id, name, type, incomings, outgoings)
                end
            end
        end
        return nodes, edges
    end
end
