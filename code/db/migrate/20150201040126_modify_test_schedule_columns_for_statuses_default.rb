class ModifyTestScheduleColumnsForStatusesDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :test_schedules, :failed, :boolean, :default => false
  end
end
