class MenusController < ApplicationController

  # GET /events  
  def events
    @events = Menu.pluck(:event).map{ |event| event.upcase if event }.reject(&:blank?).uniq
  end

  # GET /venues 
  def venues
    @venues = Menu.pluck(:venue).map{ |venue| venue.upcase if venue }.reject(&:blank?).uniq
  end

  # GET /places 
  def places
    @places = Menu.pluck(:place).map{ |place| place.upcase if place }.reject(&:blank?).uniq
  end

  # GET /by_venue 
  def by_venue
    venue = params[:venue]
    @menus = Menu.where('lower(venue) = ?', venue.downcase).all
  end

  # GET /by_event
  def by_event
    event = params[:event]
    @menus = Menu.where('lower(event) = ?', event.downcase).all
  end

end
