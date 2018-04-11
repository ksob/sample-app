class ChangeImageIdTypeInMenuPages < ActiveRecord::Migration[5.1]
  def change
    change_column :menu_pages, :image_id, :bigint
  end
end
