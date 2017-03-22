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

    #def show
    #    @process_information = ProcessInformation.find(params[:id])
    #    #redirect_to @process_information

    #    @category = @process_information.category
    #    if @category == nil
    #        @category_name = "None"
    #    else
    #        @category_name = @category.name
    #    end

    #    @separator = @process_information.separator
    #    if @separator == nil
    #        @separator_name = "None"
    #    else
    #        @separator_name = @separator.name
    #    end

    #end

    #def index
    #    @process_informations = ProcessInformation.all
    #end

    #def hostory
    #end

    #def search
    #    @search_request = SearchRequest.new(search_params)
    #    if @search_request.search_content == nil
    #        @process_informations = ProcessInformation.all
    #    else
    #        @process_informations = ProcessInformation.where("name like ?", "%" + @search_request.search_content + "%").all
    #    end
    #end

    #def edit
    #    @process_information = ProcessInformation.find(params[:id])
    #    @categories = Category.all.collect{ |c| [c.name, c.id] }
    #    @seperators = Separator.all.collect{ |s| [s.name, s.id] }
    #    @support_types = SupportType.all.collect{ |t| [t.name, t.id] }

    #end

    #def update
    #    #@category = Category.find(params[:category])
    #    @process_information = ProcessInformation.find(params[:id])
    #    params[:category] = Category.find(update_params[:category_id])
    #    params[:separator] = Separator.find(update_params[:separator_id])
    #    if @process_information.update(update_params)
    #        redirect_to @process_information
    #    else
    #        render 'edit'
    #    end
    #end

    #def destroy
    #    @process_information = ProcessInformation.find(params[:id])
    #    @process_information.destroy

    #    redirect_to process_informations_path
    #end

    private
    def info_params
        params.require(:process_information).permit(:name, :introduction, :author, :createtime, :version, :algorithm, :functional_description, :category_id, :category)
    end

    def update_params
        params.require(:process_information).permit(:name, :introduction, :author, :createtime, :version, :algorithm, :functional_description, :category_id, :category)
    end
    def search_params
        params.require(:search_request).permit(:search_content)
    end
end
