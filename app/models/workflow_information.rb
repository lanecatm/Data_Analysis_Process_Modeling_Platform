class WorkflowInformation < ActiveRecord::Base
  belongs_to :category, class_name: "WorkflowCategory"
  belongs_to :tag
  belongs_to :author, class_name: "PersonInformation"
  belongs_to :last_editor, class_name: "PersonInformation"
  has_many :workflow_comments
  has_one :workflow_privilege
end
