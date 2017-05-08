class CreateUserPictures < ActiveRecord::Migration
  def change
    create_table :user_pictures do |t|
      t.text :name
      t.text :path
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_pictures, :users
  end
end
