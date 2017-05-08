class WorkflowComment < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :comment_parent, class_name: "WorkflowComment"
  belongs_to :workflow_information
  belongs_to :process, class_name: "ProcessInformation"
  has_many :sub_comments, class_name: "WorkflowComment", foreign_key: "comment_parent"
end
