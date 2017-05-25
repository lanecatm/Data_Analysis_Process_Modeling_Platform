class CreateNodeCategories < ActiveRecord::Migration
  def change
    create_table :node_categories do |t|
      t.text :name
      t.references :node_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :node_categories, :node_types
  end
end
