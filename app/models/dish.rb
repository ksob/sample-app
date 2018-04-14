# frozen_string_literal: true

class Dish < ApplicationRecord
  has_many :menu_items
end
