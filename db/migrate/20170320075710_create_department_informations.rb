class CreateDepartmentInformations < ActiveRecord::Migration
  def change
    create_table :department_informations do |t|
      t.text :name
      t.references :parent_department, index: true
      t.text :description
      t.integer :layer
      t.references :manager, index: true
      t.references :vice_manager, index: true
      t.text :duty

      t.timestamps null: false
    end
    add_foreign_key :department_informations, :parent_departments
    add_foreign_key :department_informations, :managers
    add_foreign_key :department_informations, :vice_managers
  end
end
