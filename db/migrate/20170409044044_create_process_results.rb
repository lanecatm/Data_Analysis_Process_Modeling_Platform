class CreateProcessResults < ActiveRecord::Migration
  def change
    create_table :process_results do |t|
      t.text :body
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :process_results, :process_informations
  end
end
