class ProcessInformationsController < ApplicationController
    def new
    end

    def create
        @process_information = ProcessInformation.new(info_params)

        @process_information.save
        redirect_to @process_information
    end

    def show
        @process_information = ProcessInformation.find(params[:id])
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

    def destroy
        @process_information = ProcessInformation.find(params[:id])
        @process_information.destroy

        redirect_to process_informations_path
    end

    private
    def info_params
        params.require(:process_information).permit(:name, :introduction, :author, :createtime, :version, :algorithm, :functional_description)
    end

    def search_params
        params.require(:search_request).permit(:search_content)
    end
end
