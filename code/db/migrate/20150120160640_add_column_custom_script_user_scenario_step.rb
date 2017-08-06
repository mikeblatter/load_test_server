class AddColumnCustomScriptUserScenarioStep < ActiveRecord::Migration[5.1]
  def up
    add_column :user_scenario_steps, :custom_script, :boolean, :after => :user_scenario_id
  end

  def down
    remove_column :user_scenario_steps, :custom_script
  end
end
