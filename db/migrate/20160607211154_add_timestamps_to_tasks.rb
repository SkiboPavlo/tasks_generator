 class AddTimestampsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :created_at, :timestamp, null: false
    add_column :tasks, :updated_at, :timestamp, null: false
  end
end
