class TaskCategory < ActiveRecord::Base
    has_many :task_category_and_wikies
end
