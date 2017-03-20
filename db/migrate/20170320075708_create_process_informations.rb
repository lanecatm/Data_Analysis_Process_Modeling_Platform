class CreateProcessInformations < ActiveRecord::Migration
  def change
    create_table :process_informations do |t|
      t.references :workflow_information, index: true
      t.string :name
      t.text :description
      t.references :creater, index: true
      t.references :user, index: true
      t.boolean :is_shared
      t.references :parent_case, index: true
      t.boolean :persistent
      t.text :state
      t.integer :case_type

      t.timestamps null: false
    end
    add_foreign_key :process_informations, :workflow_informations
    add_foreign_key :process_informations, :creaters
    add_foreign_key :process_informations, :users
    add_foreign_key :process_informations, :parent_cases
  end
end
