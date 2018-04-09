class CreateMenuPages < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_pages do |t|
      t.references :menu, foreign_key: true
      t.integer :page_number
      t.integer :image_id
      t.integer :full_height
      t.integer :full_width
      t.string :uuid

      t.timestamps
    end
  end
end
