class CreateProcessFiles < ActiveRecord::Migration
  def change
    create_table :process_files do |t|
      t.text :name
      t.text :path
      t.references :process_information, index: true
      t.integer :node

      t.timestamps null: false
    end
    add_foreign_key :process_files, :process_informations
  end
end
