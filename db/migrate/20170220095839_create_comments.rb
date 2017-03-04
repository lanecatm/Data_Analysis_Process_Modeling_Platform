class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :score
      t.datetime :createtime
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :process_informations
  end
end
