class CreateUploadFiles < ActiveRecord::Migration
  def change
    create_table :upload_files do |t|
      t.text :name
      t.text :path
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :upload_files, :process_informations
  end
end
