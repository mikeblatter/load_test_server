class ChangeRepsonseTimeColumnToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :test_result_response_times, :response_time, :float
  end
end
