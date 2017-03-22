class Comment < ActiveRecord::Base
  belongs_to :workflow, class_name: "workflow_information"
end
