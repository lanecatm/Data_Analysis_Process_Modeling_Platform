class SharedProcessPrivilege < ActiveRecord::Base
  belongs_to :process
  belongs_to :edit_department
  belongs_to :execute_department
  belongs_to :delete_department
end
