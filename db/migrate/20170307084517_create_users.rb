class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.references :department, index: true

      t.timestamps null: false
    end
    add_foreign_key :users, :departments
  end
end
