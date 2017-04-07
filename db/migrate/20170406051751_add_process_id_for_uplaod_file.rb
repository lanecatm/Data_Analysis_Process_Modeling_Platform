class AddProcessIdForUplaodFile < ActiveRecord::Migration
  def change
      add_reference :uplaod_files, :process_information, index: true
  end
end
