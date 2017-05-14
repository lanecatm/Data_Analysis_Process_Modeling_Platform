class CreateNodeOptions < ActiveRecord::Migration
  def change
    create_table :node_options do |t|
      t.references :node_function, index: true
      t.integer :node_index
      t.text :name
      t.text :description
      t.text :default_value
      t.references :node_option_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :node_options, :node_functions
    add_foreign_key :node_options, :node_option_types
  end
end
