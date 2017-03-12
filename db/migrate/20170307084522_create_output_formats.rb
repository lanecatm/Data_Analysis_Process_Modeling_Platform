class CreateOutputFormats < ActiveRecord::Migration
  def change
    create_table :output_formats do |t|
      t.integer :column_index
      t.string :column_name
      t.references :column_type, index: true
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :output_formats, :column_types
    add_foreign_key :output_formats, :process_informations
  end
end
