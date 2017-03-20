class CreateWorkflowComments < ActiveRecord::Migration
  def change
    create_table :workflow_comments do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.references :author, index: true
      t.references :comment_parent, index: true
      t.references :workflow_information, index: true
      t.references :process, index: true

      t.timestamps null: false
    end
    add_foreign_key :workflow_comments, :authors
    add_foreign_key :workflow_comments, :comment_parents
    add_foreign_key :workflow_comments, :workflow_informations
    add_foreign_key :workflow_comments, :processes
  end
end
