class AddStatusToProcessInformation < ActiveRecord::Migration
  def change
    add_column :process_informations, :status, :integer
  end
end
