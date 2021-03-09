class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.timestamps
      t.integer :quantity
      t.integer :unit_price
      t.string :search
      t.text :image 
    end
  end
end
