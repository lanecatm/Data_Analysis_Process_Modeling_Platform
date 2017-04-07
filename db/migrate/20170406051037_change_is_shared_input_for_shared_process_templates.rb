class ChangeIsSharedInputForSharedProcessTemplates < ActiveRecord::Migration
    def change
        rename_column :shared_process_privileges, :isSharedSampleInput, :is_shared_sample_input
    end
end

