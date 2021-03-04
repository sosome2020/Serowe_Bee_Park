class AddIndexToTitleAndStatus < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, :task_name
    add_index :tasks, :status
      add_index :tasks, :search
  end
end
