class CreateArffTypes < ActiveRecord::Migration
  def change
    create_table :arff_types do |t|
      t.text :name
      t.text :description

      t.timestamps null: false
    end
  end
end
