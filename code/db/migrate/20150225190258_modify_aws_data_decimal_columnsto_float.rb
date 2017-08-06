class ModifyAwsDataDecimalColumnstoFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :aws_ec2_instance_data, :datapoint_average, :float
    change_column :aws_rds_instance_data, :datapoint_average, :float
  end
end
