class CreateWorkflowCategories < ActiveRecord::Migration
  def change
    create_table :workflow_categories do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
