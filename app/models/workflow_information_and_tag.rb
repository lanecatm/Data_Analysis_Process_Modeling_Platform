class WorkflowInformationAndTag < ActiveRecord::Base
  belongs_to :workflow_information
  belongs_to :workflow_tag
end
