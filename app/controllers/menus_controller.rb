class MenusController < ApplicationController
  def index
    
  end

  def events
    @events = Menu.pluck(:event).map{ |event| event.upcase if event }.uniq
  end

  def venues
    @venues = Menu.pluck(:venue).map{ |venue| venue.upcase if venue }.uniq
  end

  def places
    @places = Menu.pluck(:place).map{ |place| place.upcase if place }.uniq
  end

  def by_venue
    venue = params[:venue]
    @menus = Menu.where('lower(venue) = ?', venue.downcase).all
  end

  def by_event
    event = params[:event]
    @menus = Menu.where('lower(event) = ?', event.downcase).all
  end


end
