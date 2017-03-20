class WorkflowPrivilege < ActiveRecord::Base
  belongs_to :workflow_information
  belongs_to :edit_department
  belongs_to :execute_department
  belongs_to :delete_department
end
