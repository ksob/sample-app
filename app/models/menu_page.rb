# frozen_string_literal: true

class MenuPage < ApplicationRecord
  belongs_to :menu
  has_many :menu_items
end
