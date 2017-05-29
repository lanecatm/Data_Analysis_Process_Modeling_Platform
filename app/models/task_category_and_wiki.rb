class TaskCategoryAndWiki < ActiveRecord::Base
  belongs_to :task_category
  belongs_to :wiki_page
end
