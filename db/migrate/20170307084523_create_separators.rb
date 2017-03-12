class CreateSeparators < ActiveRecord::Migration
  def change
    create_table :separators do |t|
      t.string :name
      t.text :description
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :separators, :process_informations
  end
end
