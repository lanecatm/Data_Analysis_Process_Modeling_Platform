class CreateNodeCategories < ActiveRecord::Migration
  def change
    create_table :node_categories do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
