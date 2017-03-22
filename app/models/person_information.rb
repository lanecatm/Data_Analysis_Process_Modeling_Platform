class PersonInformation < ActiveRecord::Base
    has_many  manage_departments, class_name: "DepartmentInformation", foreign_key: "manager"
    has_many :vice_manage_departments, class_name: "DepartmentInformation", foreign_key: "vice_manager"
    
    has_many :create_workflows, class_name: "WorkflowInformation", foreign_key: "author"
    has_many :edit_workflows, class_name: "WorkflowInformation", foreign_key: "last_editor"

    has_many :create_processes, class_name: "ProcessInformation", foreign_key: "creater"
    has_many :use_processes, class_name: "PersonInformation", foreign_key: "user"

    has_many :workflow_comments, foreign_key: "author"
end
