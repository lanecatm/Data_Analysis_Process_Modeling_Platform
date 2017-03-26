class WorkflowInformation < ActiveRecord::Base
  belongs_to :category, class_name: "WorkflowCategory"
  belongs_to :tag
  belongs_to :author, class_name: "PersonInformation"
  belongs_to :last_editor, class_name: "PersonInformation"
  has_many :workflow_comments
  has_one :workflow_privilege
  has_many :workflow_information_and_tags
  has_many :workflow_tags, :through => :workflow_information_and_tags
end
