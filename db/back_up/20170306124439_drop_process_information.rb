class DropProcessInformation < ActiveRecord::Migration
  def change
      drop_table :process_informations
  end
end
