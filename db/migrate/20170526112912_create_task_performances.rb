class CreateTaskPerformances < ActiveRecord::Migration
  def change
    create_table :task_performances do |t|
      t.text :name
      t.text :description
      t.references :wiki_page, index: true

      t.timestamps null: false
    end
    add_foreign_key :task_performances, :wiki_pages
  end
end
