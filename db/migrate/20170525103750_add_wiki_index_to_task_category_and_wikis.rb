class AddWikiIndexToTaskCategoryAndWikis < ActiveRecord::Migration
  def change
      remove_column :task_category_and_wikis, :wiki_page_path
      add_column :task_category_and_wikis, :wiki_page_id, :integer
      add_index :task_category_and_wikis, :wiki_page_id
  end
end
