class DepartmentInformation < ActiveRecord::Base
  belongs_to :parent_department, class_name: "DepartmentInformation"
  belongs_to :manager, class_name: "PersonInformation"
  belongs_to :vice_manager, class_name: "PersonInformation"

  has_many :sub_department_informations, class_name: "DepartmentInformation", foreign_key: "parent_department"

end
