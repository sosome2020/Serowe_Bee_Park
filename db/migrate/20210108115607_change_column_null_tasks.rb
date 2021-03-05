class ChangeColumnNullTasks < ActiveRecord::Migration[6.0]
  change_column :tasks, :name, :string, null: false
end
