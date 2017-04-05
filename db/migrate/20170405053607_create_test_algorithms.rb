class CreateTestAlgorithms < ActiveRecord::Migration
  def change
    create_table :test_algorithms do |t|
      t.string :name
      t.integer :param1
      t.string :param2
      t.string :param3
      t.references :process_information, index: true

      t.timestamps null: false
    end
    add_foreign_key :test_algorithms, :process_informations
  end
end
