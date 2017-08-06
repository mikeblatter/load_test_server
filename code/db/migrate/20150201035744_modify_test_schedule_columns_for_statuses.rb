class ModifyTestScheduleColumnsForStatuses < ActiveRecord::Migration[5.1]
  def change
    rename_column :test_schedules, :cancel, :cancelled
    add_column :test_schedules, :failed, :boolean, :after => :complete
  end
end
