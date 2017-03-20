class DepartmentInformation < ActiveRecord::Base
  belongs_to :parent_department
  belongs_to :manager
  belongs_to :vice_manager
end
