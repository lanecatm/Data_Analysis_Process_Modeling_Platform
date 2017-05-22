class TaskController < WikiPagesController 
    def new
      @node = Homeland::Node.new
    end
    def create
        # TODO name 不能包含标点
        name = task_params[:name]
        path = name.gsub(" ", "_") 
        @wiki_pages = WikiPage.where(:path => path).all
        task_category_id = task_params[:task_category]
        # TODO if cannot find task_category
        task_category = TaskCategory.find(task_category_id)
        existing_task_category_and_wiki = TaskCategoryAndWiki.where(:wiki_page_path => path).first
        if existing_task_category_and_wiki == nil
            TaskCategoryAndWiki.create(:task_category_id => task_category.id, :wiki_page_path => path)
        else
            existing_task_category_and_wiki.update(:task_category_id=>task_category.id)
        end

        existing_node = Homeland::Node.where()
        @node = Homeland::Node.new(node_params[:node])
        if not @node.save
            redirect_to new_task_path
            return
        end


        if @wiki_pages[0] == nil
            redirect_to new_wiki_page_path(path)
        else
            redirect_to wiki_page_path(path)
        end
    end

    def create_page
        wiki_pages_controller = WikiPagesController.new
        wiki_pages_controller.create(params)
    end

    private
    def task_params
        params.require(:task).permit(:name, :task_category)
    end

    def node_params
        params.require(:task).permit(node:[:name, :description, :color, :sort])
    end
end
