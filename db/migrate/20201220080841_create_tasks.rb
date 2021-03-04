class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :task_detail
      t.datetime :expiration_date, default: "2021/01/27"
      t.timestamps
      t.string :status
      t.integer :priority
      t.string :search
    end
  end
end
