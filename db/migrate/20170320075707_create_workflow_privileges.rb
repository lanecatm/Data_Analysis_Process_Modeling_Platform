class CreateWorkflowPrivileges < ActiveRecord::Migration
  def change
    create_table :workflow_privileges do |t|
      t.references :workflow_information, index: true
      t.references :edit_department, index: true
      t.references :execute_department, index: true
      t.references :delete_department, index: true

      t.timestamps null: false
    end
    add_foreign_key :workflow_privileges, :workflow_informations
    add_foreign_key :workflow_privileges, :edit_departments
    add_foreign_key :workflow_privileges, :execute_departments
    add_foreign_key :workflow_privileges, :delete_departments
  end
end
