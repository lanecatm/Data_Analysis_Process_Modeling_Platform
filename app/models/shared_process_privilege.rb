class SharedProcessPrivilege < ActiveRecord::Base
  belongs_to :process, class_name: "ProcessInformation"
  belongs_to :edit_department, class_name: "DepartmentInformation"
  belongs_to :execute_department, class_name: "DepartmentInformation"
  belongs_to :delete_department, class_name: "DepartmentInformation"

end
