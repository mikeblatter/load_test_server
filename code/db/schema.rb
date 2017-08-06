# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150309192222) do

  create_table "aws_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "encrypted_access_key_id"
    t.text "encrypted_secret_access_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aws_ec2_instance_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_result_aws_ec2_instance_id"
    t.datetime "datapoint_timestamp"
    t.string "datapoint_unit"
    t.float "datapoint_average", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_result_aws_ec2_instance_id"], name: "index_aws_ec2_instance_data_on_test_result_aws_ec2_instance_id"
  end

  create_table "aws_ec2_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "aws_account_id"
    t.string "name"
    t.string "instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_account_id"], name: "index_aws_ec2_instances_on_aws_account_id"
  end

  create_table "aws_rds_instance_data", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_result_aws_rds_instance_id"
    t.datetime "datapoint_timestamp"
    t.string "datapoint_unit"
    t.float "datapoint_average", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_result_aws_rds_instance_id"], name: "index_aws_rds_instance_data_on_test_result_aws_rds_instance_id"
  end

  create_table "aws_rds_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "aws_account_id"
    t.string "name"
    t.string "db_instance_identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_account_id"], name: "index_aws_rds_instances_on_aws_account_id"
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "load_test_aws_ec2_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "load_test_id"
    t.bigint "aws_ec2_instance_id"
    t.string "metric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_ec2_instance_id"], name: "index_load_test_aws_ec2_instances_on_aws_ec2_instance_id"
    t.index ["load_test_id"], name: "index_load_test_aws_ec2_instances_on_load_test_id"
  end

  create_table "load_test_aws_rds_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "load_test_id"
    t.bigint "aws_rds_instance_id"
    t.string "metric"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_rds_instance_id"], name: "index_load_test_aws_rds_instances_on_aws_rds_instance_id"
    t.index ["load_test_id"], name: "index_load_test_aws_rds_instances_on_load_test_id"
  end

  create_table "load_test_schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "load_test_id"
    t.integer "maximum_virtual_users"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_test_id"], name: "index_load_test_schedules_on_load_test_id"
  end

  create_table "load_tests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_scenario_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_scenario_id"], name: "index_load_tests_on_user_scenario_id"
  end

  create_table "scenario_step_request_params", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_scenario_step_id"
    t.string "request_key"
    t.string "request_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_scenario_step_id"], name: "index_scenario_step_request_params_on_user_scenario_step_id"
  end

  create_table "test_result_aws_ec2_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_result_id"
    t.bigint "aws_ec2_instance_id"
    t.string "metric"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_ec2_instance_id"], name: "index_test_result_aws_ec2_instances_on_aws_ec2_instance_id"
    t.index ["test_result_id"], name: "index_test_result_aws_ec2_instances_on_test_result_id"
  end

  create_table "test_result_aws_rds_instances", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_result_id"
    t.bigint "aws_rds_instance_id"
    t.string "metric"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aws_rds_instance_id"], name: "index_test_result_aws_rds_instances_on_aws_rds_instance_id"
    t.index ["test_result_id"], name: "index_test_result_aws_rds_instances_on_test_result_id"
  end

  create_table "test_result_response_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_result_id"
    t.datetime "datapoint_timestamp"
    t.integer "response_code"
    t.integer "number_of_times"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_result_id"], name: "index_test_result_response_codes_on_test_result_id"
  end

  create_table "test_result_response_times", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_result_id"
    t.datetime "datapoint_timestamp"
    t.float "response_time_sum", limit: 24
    t.integer "number_of_times"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_result_id"], name: "index_test_result_response_times_on_test_result_id"
  end

  create_table "test_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "test_schedule_id"
    t.boolean "in_progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_schedule_id"], name: "index_test_results_on_test_schedule_id"
  end

  create_table "test_schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "load_test_id"
    t.boolean "schedule_now", default: true
    t.datetime "schedule_at"
    t.boolean "started", default: false
    t.boolean "complete", default: false
    t.boolean "failed", default: false
    t.text "failed_message"
    t.boolean "cancelled", default: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["load_test_id"], name: "index_test_schedules_on_load_test_id"
  end

  create_table "user_scenario_steps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_scenario_id"
    t.string "request_url"
    t.string "request_type"
    t.integer "step_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_scenario_id"], name: "index_user_scenario_steps_on_user_scenario_id"
  end

  create_table "user_scenarios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
