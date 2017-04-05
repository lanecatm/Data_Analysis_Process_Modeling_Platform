class CreateUplaodFiles < ActiveRecord::Migration
  def change
    create_table :uplaod_files do |t|
      t.text :name
      t.text :path

      t.timestamps null: false
    end
  end
end
