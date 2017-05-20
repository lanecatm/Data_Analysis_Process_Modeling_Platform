class CreateSeparators < ActiveRecord::Migration
  def change
    create_table :separators do |t|
      t.text :name
      t.text :value

      t.timestamps null: false
    end
  end
end
