class TaskController < WikiPagesController 
    def new
    end
    def create
        # TODO name 不能包含标点
        name = task_params[:name]
        name = name.gsub(" ", "_") 
        if WikiPages.find(:name => name)
            redirect_to 
        redirect_to new_wiki_page_path(name)
    end

    private
    def task_params
        params.require(:task).permit(:name, :category)
    end
end
