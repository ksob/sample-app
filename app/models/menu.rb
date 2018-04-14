# frozen_string_literal: true

class Menu < ApplicationRecord
  has_many :menu_pages

  scope :by_place_and_date, -> (place, from_date, to_date) {
    where(place: place).where(date: from_date..to_date).all
  }
end
