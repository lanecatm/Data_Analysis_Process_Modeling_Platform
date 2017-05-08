class ProcessInformation < ActiveRecord::Base
  belongs_to :workflow_information
  belongs_to :creater, class_name: "User"
  belongs_to :user, class_name: "User"
  belongs_to :parent_case, class_name: "ProcessInformation"
  has_many :workflow_comments, foreign_key: "process"
  has_many :sub_cases, class_name: "ProcessInformation", foreign_key: "parent_case"

  has_one :upload_file, dependent: :destroy
  has_one :download_file, dependent: :destroy
  has_one :process_result, dependent: :destroy
  has_one :test_algorithm, dependent: :destroy
  has_one :shared_process_privilege, class_name: "SharedProcessPrivilege", foreign_key: "process_id", dependent: :destroy
end
