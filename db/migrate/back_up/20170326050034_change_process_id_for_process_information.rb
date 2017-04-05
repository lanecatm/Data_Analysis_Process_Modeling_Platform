class ChangeProcessIdForProcessInformation < ActiveRecord::Migration
  def change
      add_reference :process_informations, :process, polymorphic: false, index: true
  end
end
