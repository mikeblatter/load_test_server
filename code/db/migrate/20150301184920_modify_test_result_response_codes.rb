class ModifyTestResultResponseCodes < ActiveRecord::Migration[5.1]
  def change
    add_column :test_result_response_codes, :number_of_times, :integer, :after => :response_code
  end
end
