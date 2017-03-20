class CreateSharedProcessPrivileges < ActiveRecord::Migration
  def change
    create_table :shared_process_privileges do |t|
      t.references :process, index: true
      t.references :edit_department, index: true
      t.references :execute_department, index: true
      t.references :delete_department, index: true
      t.boolean :isSharedSampleInput

      t.timestamps null: false
    end
    add_foreign_key :shared_process_privileges, :processes
    add_foreign_key :shared_process_privileges, :edit_departments
    add_foreign_key :shared_process_privileges, :execute_departments
    add_foreign_key :shared_process_privileges, :delete_departments
  end
end
