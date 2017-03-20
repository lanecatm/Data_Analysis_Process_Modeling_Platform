class WorkflowComment < ActiveRecord::Base
  belongs_to :author
  belongs_to :comment_parent
  belongs_to :workflow_information
  belongs_to :process
end
