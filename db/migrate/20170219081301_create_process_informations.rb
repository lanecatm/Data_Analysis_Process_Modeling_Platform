class CreateProcessInformations < ActiveRecord::Migration
  def change
    create_table :process_informations do |t|
      t.string :name
      t.text :introduction
      t.string :author
      t.datetime :createtime
      t.string :version
      t.string :algorithm
      t.text :functional_description

      t.timestamps null: false
    end
  end
end
