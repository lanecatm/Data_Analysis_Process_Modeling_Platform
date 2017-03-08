class ProcessInformationsController < ApplicationController
    PROCESS_INFO_INIT = 1
    PROCESS_INFO_PUBLISH = 2
    PROCESS_INFO_EDITING = 3

    def new
    end

    def create
        @process_information = ProcessInformation.new(info_params)
        @process_information.status = PROCESS_INFO_INIT
        @process_information.save
        #redirect_to @process_information
        redirect_to edit_process_information_path(@process_information.id)
    end

    def show
        @process_information = ProcessInformation.find(params[:id])
        #redirect_to @process_information
        @category_id = @process_information.category.name
        #@category_name = Category.find(@category_id)
    end

    def index
        @process_informations = ProcessInformation.all
    end

    def search
        @search_request = SearchRequest.new(search_params)
        if @search_request.search_content == nil
            @process_informations = ProcessInformation.all
        else
            @process_informations = ProcessInformation.where("name like ?", "%" + @search_request.search_content + "%").all
        end
    end

    def edit
        @process_information = ProcessInformation.find(params[:id])
        @categories = Category.all.collect{ |c| [c.name, c.id] }
    end

    def update
        #@category = Category.find(params[:category])
        @process_information = ProcessInformation.find(params[:id])
        params[:category] = Category.find(info_params[:category_id])
        if @process_information.update(info_params)
            redirect_to @process_information
        else
            render 'edit'
        end
    end

    def destroy
        @process_information = ProcessInformation.find(params[:id])
        @process_information.destroy

        redirect_to process_informations_path
    end

    private
    def info_params
        params.require(:process_information).permit(:name, :introduction, :author, :createtime, :version, :algorithm, :functional_description, :category_id, :category)
    end

    def search_params
        params.require(:search_request).permit(:search_content)
    end
end
