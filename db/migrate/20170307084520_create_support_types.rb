class CreateSupportTypes < ActiveRecord::Migration
  def change
    create_table :support_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
