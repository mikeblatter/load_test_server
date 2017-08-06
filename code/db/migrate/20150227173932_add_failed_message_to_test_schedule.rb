class AddFailedMessageToTestSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :test_schedules, :failed_message, :text, :after => :failed
  end
end
