class WorkflowPrivilege < ActiveRecord::Base
  belongs_to :workflow_information
  belongs_to :edit_department, class_name: "DepartmentInformation"
  belongs_to :execute_department, class_name: "DepartmentInformation"
  belongs_to :delete_department, class_name: "DepartmentInformation"

  def default_department
      @edit_department = DepartmentInformation.find(1)
      @execute_department = DepartmentInformation.find(1)
      @delete_department = DepartmentInformation.find(1)
  end
end
