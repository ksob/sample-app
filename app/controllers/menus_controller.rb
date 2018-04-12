class MenusController < ApplicationController
  def index
    
  end

  def events
    @events = Menu.pluck(:event).map{ |event| event.upcase if event }.uniq
  end

  def venues
    @venues = Menu.pluck(:venue).map{ |venue| venue.upcase if venue }.uniq
  end

  def by_venue
    venue = params[:venue]
    @menus = Menu.where('lower(venue) = ?', venue.downcase).all
  end


end
