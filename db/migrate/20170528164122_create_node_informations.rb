class CreateNodeInformations < ActiveRecord::Migration
  def change
    create_table :node_informations do |t|
      t.text :name
      t.references :node_function, index: true
      t.references :workflow_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :node_informations, :node_functions
    add_foreign_key :node_informations, :workflow_informations
  end
end
