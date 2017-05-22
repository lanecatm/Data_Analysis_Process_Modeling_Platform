class CreateTaskCategoryAndWikis < ActiveRecord::Migration
  def change
    create_table :task_category_and_wikis do |t|
      t.references :task_category, index: true
      t.text :wiki_page_path

      t.timestamps null: false
    end
    add_foreign_key :task_category_and_wikis, :task_categories
  end
end
