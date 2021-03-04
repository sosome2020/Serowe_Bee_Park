class ChangeColumnNullTasks < ActiveRecord::Migration[6.0]
  change_column :tasks, :task_name, :string, null: false
  change_column :tasks, :task_detail, :text, null: false
end
