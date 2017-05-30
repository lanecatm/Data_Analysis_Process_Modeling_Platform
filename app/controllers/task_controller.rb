class TaskController < WikiPagesController 
    def new
      @node = Homeland::Node.new
    end

    def create
        # TODO name 不能包含标点
        name = task_params[:name]
        path = name.gsub(" ", "_") 
        @wiki_pages = WikiPage.where(:path => path).all
        if @wiki_pages[0] == nil
            # 如果为空，新建一个WikiPage和一个WikiPageVersion
            @wiki_page = WikiPage.create(:creator_id=>current_user.id, :updator_id => current_user.id,:path => path, :title => name, :content => task_params[:content])
            @wiki_page_version = WikiPageVersion.create(:page_id => @wiki_page.id, :updator_id => current_user.id, :number=> 1, :comment=> task_params[:comment], :path => path, :title => name, :content => task_params[:content])
            task_category_id = task_params[:task_category]
            TaskCategoryAndWiki.create(:task_category_id => task_category_id, :wiki_page_id => @wiki_page.id)
            @homeland_node = Homeland::Node.new(node_params[:node])
            @homeland_node.wiki_page_id = @wiki_page.id
            if not @homeland_node.save
                # 如果已经创建该论坛，跳转到论坛列表
                redirect_to homeland.nodes_path(:notice => "forum has created")
            else
                redirect_to wiki_page_path(path)
            end
        else
            redirect_to wiki_page_path(path)
        end
    end

    def create_performance
        @task_performances = TaskPerformance.create(task_performance_params)
        path = WikiPage.find(params[:task_id]).path

        redirect_to wiki_page_path(path, :active_page => "performance")

    end

    def create_page
        wiki_pages_controller = WikiPagesController.new
        wiki_pages_controller.create(params)
    end

    private
    def task_params
        params.require(:task).permit(:name, :task_category, :content, :comment)
    end

    def node_params
        params.require(:task).permit(node:[:name, :description, :color, :sort])
    end

    def task_performance_params
        params.require(:task_performance).permit(:name, :description, :wiki_page_id)
    end
end
