class RemoveUserScenarioStepColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :user_scenario_steps, :custom_script
    remove_column :user_scenario_steps, :response_type
    remove_column :user_scenario_steps, :download_resources
    remove_column :user_scenario_steps, :ruby_script
  end
end
