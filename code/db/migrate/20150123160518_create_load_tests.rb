class CreateLoadTests < ActiveRecord::Migration[5.1]
  def change
    create_table :load_tests do |t|
      t.string :name

      t.timestamps
    end
  end
end
