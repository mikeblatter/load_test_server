class AddUserScenarioStepOrderColumn < ActiveRecord::Migration[5.1]
  def up
    add_column :user_scenario_steps, :step_order, :integer, :after => :ruby_script
  end

  def down
    remove_column :user_scenario_steps, :step_order
  end
end
