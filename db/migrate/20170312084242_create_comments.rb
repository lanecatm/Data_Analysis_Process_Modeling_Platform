class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.text :body
      t.integer :score
      t.references :author, index: true
      t.references :comment_parent, index: true
      t.references :workflow, index: true
      t.references :process, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :authors
    add_foreign_key :comments, :comment_parents
    add_foreign_key :comments, :workflows
    add_foreign_key :comments, :processes
  end
end
