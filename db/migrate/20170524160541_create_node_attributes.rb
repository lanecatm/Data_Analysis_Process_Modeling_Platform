class CreateNodeAttributes < ActiveRecord::Migration
  def change
    create_table :node_attributes do |t|
      t.text :name
      t.references :node_function, index: true

      t.timestamps null: false
    end
    add_foreign_key :node_attributes, :node_functions
  end
end
