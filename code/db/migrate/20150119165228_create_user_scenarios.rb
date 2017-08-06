class CreateUserScenarios < ActiveRecord::Migration[5.1]
  def change
    create_table :user_scenarios do |t|
      t.string :name

      t.timestamps
    end
  end
end
