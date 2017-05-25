class NodeController < ApplicationController

    def new
        @node_function = NodeFunction.new
        @node_categories = NodeCategory.all

    end

    def create
        @node_function = NodeFunction.create(node_function_params)
        redirect_to node_path(@node_function.id)
    end

    def show
        @node_function = NodeFunction.find(params[:id])
    end

    def edit
        @node_function = NodeFunction.find(params[:id])
    end

    def update
        @node_function = NodeFunction.find(params[:id])
        redirect_to node_path(@node_function.id)
    end

    def index
        @node_functions = NodeFunction.all
    end

    
    def destroy

        @node_function = NodeFunction.find(params[:id])
        if @node_function.destroy
            redirect_to node_index_path
        else
            redirect_to node_index_path(:notice => "destory failed")
        end
    end

    def save
        params[:node][:option].each { |node_id,node_value| 


        }
        redirect_to node_index_path(params[:node][:option])
    end

    private
    def node_function_params
        params.require(:node_function).permit(:name, :description, :node_category_id, node_options_attributes:[:name, :label, :description, :default_value, :node_option_type_id, node_option_choices_attributes:[:name, :value]])
    end

    def node_params
        params.require(:node).permit(:option)
    end


end
