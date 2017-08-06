class CreateLoadTestSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :load_test_schedules do |t|
      t.belongs_to :load_test, index: true
      t.integer :maximum_virtual_users
      t.integer :duration

      t.timestamps
    end
  end
end
