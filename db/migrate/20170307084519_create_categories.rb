class CreateCategories < ActiveRecord::Migration
  def change
    drop_table :categories
    create_table :categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
