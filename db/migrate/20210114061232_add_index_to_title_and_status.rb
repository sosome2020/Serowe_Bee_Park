class AddIndexToTitleAndStatus < ActiveRecord::Migration[6.0]
  def change
    add_index :tasks, :name
    add_index :tasks, :unit_price
      add_index :tasks, :search
  end
end
