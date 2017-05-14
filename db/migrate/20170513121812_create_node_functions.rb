class CreateNodeFunctions < ActiveRecord::Migration
  def change
    create_table :node_functions do |t|
      t.text :name
      t.text :description
      t.references :node_type, index: true
      t.references :node_function, index: true

      t.timestamps null: false
    end
    add_foreign_key :node_functions, :node_types
    add_foreign_key :node_functions, :node_functions
  end
end
