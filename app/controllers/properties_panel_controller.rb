class PropertiesPanelController < ApplicationController

	def new
		@workflow_information_id = params[:article][:workflow_information_id]
		@xml = params[:article][:xml]	
		@selected_element = params[:article][:selected_element]	
		@debug_info = @selected_element


		redirect_to edit_workflow_information_path(@workflow_information_id, :active_page => "diagram", :debug_info => @selected_element)
	end

end
