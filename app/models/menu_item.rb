class MenuItem < ApplicationRecord
  belongs_to :menu_page
  belongs_to :dish
end
