class NodeController < ApplicationController

    def new
        @node_function = NodeFunction.new

    end

    def create
        @node_function = NodeFunction.create(node_function_params)
        redirect_to node_path(@node_function.id)
    end

    def show
        @node_function = NodeFunction.find(params[:id])
        @node_information = NodeInformation.where(:node_function_id => @node_function.id).first
        @node_information = NodeInformation.where(:name => "task_" + @node_function.id.to_s).first
    end

    def edit
        @node_function = NodeFunction.find(params[:id])
    end

    def update
        @node_function = NodeFunction.find(params[:id])
        @node_function.destroy
        @node_function = NodeFunction.create(node_function_params)
        redirect_to node_path(@node_function.id)
    end

    def index
        @node_functions = NodeFunction.all
        @node_information = NodeInformation.new
    end

    
    def destroy
        @node_function = NodeFunction.find(params[:id])
        if @node_function.destroy
            redirect_to node_index_path
        else
            redirect_to node_index_path(:notice => "destroy failed")
        end
    end

    def save
        @node_informations = NodeInformation.where(:name => node_params[:name], :workflow_information_id => node_params[:workflow_information_id]).all
        @node_informations.each do |node_information|
           node_information.destroy
        end
        @node_information = NodeInformation.create(node_params)
        params[:node][:option].each { |node_id,node_value| 
            node_option_value = NodeOptionValue.create(:node_option_id => node_id, :value => node_value, :node_information_id =>@node_information.id)
        }
        redirect_to node_path(params[:node_id])
    end

    def save_all
        @node_informations = NodeInformation.where(:name => node_params[:name], :workflow_information_id => node_params[:workflow_information_id]).all
        @node_informations.each do |node_information|
           node_information.destroy
        end
        @node_information = NodeInformation.create(node_params)
        params[:node][:option].each { |node_id,node_value| 
            node_option_value = NodeOptionValue.create(:node_option_id => node_id, :value => node_value, :node_information_id =>@node_information.id)
        }
        redirect_to node_index_path
    end

    private
    def node_function_params
        params.require(:node_function).permit(:name, :description, :node_category_id, node_options_attributes:[:name, :label, :description, :default_value, :node_option_type_id, node_option_choices_attributes:[:name, :value]])
    end

    def node_params
        params.require(:node).permit(:workflow_information_id, :name, :node_function_id)
    end


end
