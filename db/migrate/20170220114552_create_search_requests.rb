class CreateSearchRequests < ActiveRecord::Migration
  def change
    create_table :search_requests do |t|
      t.string :search_content
      t.string :search_type

      t.timestamps null: false
    end
  end
end
