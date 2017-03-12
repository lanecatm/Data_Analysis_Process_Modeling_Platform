class CreateInputFormats < ActiveRecord::Migration
  def change
    create_table :input_formats do |t|
      t.integer :column_index
      t.string :column_name
      t.references :column_type, index: true
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :input_formats, :column_types
    add_foreign_key :input_formats, :process_informations
  end
end
