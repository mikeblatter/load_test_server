class CreateUserScenarioSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :user_scenario_steps do |t|
      t.belongs_to :load_test, index: true
      t.string :request_url
      t.string :request_type
      t.string :response_type
      t.boolean :download_resources
      t.text :ruby_script

      t.timestamps
    end
  end
end
