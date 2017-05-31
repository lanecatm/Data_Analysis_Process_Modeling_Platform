# encoding: UTF-8
class PropertiesPanelController < ApplicationController
    def new
        @workflow_information_id = params[:article][:workflow_information_id]
        @xml = params[:article][:xml]	
        @selected_element = params[:article][:selected_element]	
        @debug_info = @selected_element
        @workflow_information = WorkflowInformation.find(@workflow_information_id)
        @workflow_information.xml = @xml
        @workflow_information.save
        redirect_to edit_workflow_information_path(@workflow_information_id, :active_page => "diagram", :active_tab => @selected_element)
    end
    private
end
