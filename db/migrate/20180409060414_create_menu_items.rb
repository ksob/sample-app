class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.references :menu_page, foreign_key: true
      t.float :price
      t.float :high_price
      t.references :dish, foreign_key: true
      t.float :xpos
      t.float :ypos

      t.timestamps
    end
  end
end
