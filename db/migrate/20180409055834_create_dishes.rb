class CreateDishes < ActiveRecord::Migration[5.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :description
      t.integer :menus_appeared
      t.integer :times_appeared
      t.date :first_appeared
      t.date :last_appeared
      t.float :lowest_price
      t.float :highest_price

      t.timestamps
    end
  end
end
