class CreatePersonInformations < ActiveRecord::Migration
  def change
    create_table :person_informations do |t|
      t.string :person_name
      t.string :user_name
      t.string :gender
      t.datetime :birthday
      t.text :description
      t.string :phone_number
      t.string :email
      t.string :technical_post
      t.integer :state
      t.string :password

      t.timestamps null: false
    end
  end
end
