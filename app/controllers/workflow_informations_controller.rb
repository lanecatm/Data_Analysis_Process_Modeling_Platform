class WorkflowInformationsController < ApplicationController
    WORKFLOW_INFO_INIT = 1
    WORKFLOW_INFO_PUBLISH = 2
    WORKFLOW_INFO_EDITING = 3

    def new
        
    end

    def create
        @workflow_information = WorkflowInformation.create(all_params)
        @workflow_information.status = WORKFLOW_INFO_INIT
        # TODO 这些参数从页面传回
        @workflow_information.author = PersonInformation.find(1)
        @workflow_information.last_editor = PersonInformation.find(1)
        @workflow_information.save

        @workflow_privilege = WorkflowPrivilege.create
        @workflow_privilege.edit_department = DepartmentInformation.find(1)
        @workflow_privilege.execute_department = DepartmentInformation.find(1)
        @workflow_privilege.delete_department = DepartmentInformation.find(1)
        @workflow_privilege.workflow_information = @workflow_information
        @workflow_privilege.save
        #@workflow_information.save
        #redirect_to @workflow_information
        redirect_to edit_workflow_information_path(@workflow_information.id)
    end

    def edit
        @workflow_information = WorkflowInformation.find(params[:id])
        if @workflow_information.status == WORKFLOW_INFO_PUBLISH
            workflow_information_hash = @workflow_information.attributes
            workflow_information_hash.delete("id")
            @new_workflow_information = WorkflowInformation.create(workflow_information_hash)
            @new_workflow_information.status = WORKFLOW_INFO_EDITING
            # TODO change
            @new_workflow_information.last_editor = PersonInformation.find(1)
            @new_workflow_information.save

            if @workflow_privilege_hash != nil
                workflow_privilege_hash = @workflow_information.workflow_privilege.attributes
            else
                workflow_privilege_hash = {:edit_department_id => 1, :execute_department_id => 1, :delete_department_id => 1}
            end
            workflow_privilege_hash.delete("id")
            @workflow_privilege = WorkflowPrivilege.create(workflow_privilege_hash)
            @workflow_privilege.workflow_information = @new_workflow_information
            @workflow_privilege.save
            redirect_to edit_workflow_information_path(@new_workflow_information.id)
        end
        @categories = WorkflowCategory.all.collect{|t| [t.name, t.id]}
        @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}
        @active_page = params[:active_page] == nil ? "info" : params[:active_page]
        @workflow_tag_str = ""
        @workflow_information.workflow_tags.each do |tag|
            @workflow_tag_str = @workflow_tag_str + tag.name + ","
            @execute_department_choice = @workflow_information.workflow_privilege == nil ? 1 : @workflow_information.workflow_privilege.execute_department_id
            @edit_department_choice = @workflow_information.workflow_privilege == nil ? 1 : @workflow_information.workflow_privilege.edit_department_id
            @delete_department_choice = @workflow_information.workflow_privilege == nil ? 1 : @workflow_information.workflow_privilege.delete_department_id
        end
    end

    def update
        @workflow_information = WorkflowInformation.find(params[:id])
        case params[:commit]
        when "Save Information"
            @active_page = "info"

            # delete origin tags
            origin_tags = @workflow_information.workflow_tags.all
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


            if @workflow_information.update(all_params)
                redirect_to edit_workflow_information_path(@workflow_information.id, :active_page => @active_page)
            else
                render 'edit'
            end
        when "Save Privilege"
            @active_page = "jurisdiction"
            @workflow_privilege = @workflow_information.workflow_privilege
            if @workflow_privilege.update(workflow_privilege_params[:workflow_privilege])
                @departments = DepartmentInformation.all.all.collect{|t| [t.name, t.id]}
                redirect_to edit_workflow_information_path(@workflow_information.id, :active_page => @active_page)
            else
                render 'edit'
            end
            #when "Save Version"
            #    @active_page = "version"
            #    if @workflow_information.update(version_params)
            #        redirect_to edit_workflow_information_path(@workflow_information.id, :active_page => @active_page)
            #    else
            #        render 'edit'
            #    end
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
                    # TODO 把这段代码扔到点击edit按钮的时候
                    #workflow_information_hash = @workflow_information.attributes
                    #workflow_information_hash.delete("id")
                    #@new_workflow_information = WorkflowInformation.create(workflow_information_hash)
                    # TODO 关联父节点

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

end
