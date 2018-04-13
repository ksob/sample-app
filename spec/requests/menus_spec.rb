require 'rails_helper'

RSpec.describe 'Menus', type: :request do
  before :each do          
    FactoryGirl.create(:menu)
    FactoryGirl.create(:menu, event: "brunch")
    FactoryGirl.create(:menu, venue: "RESTAURANT")
    FactoryGirl.create(:menu, place: "Hotel Gramercy Park; 52 Gramercy Park North")
  end

  describe 'GET /events' do
    before { get '/menus/events' }

    it 'returns BREAKFAST event' do
      expect(response.body)
          .to have_tag('a', :with => { :href => "/menus/by_event.BREAKFAST" }, :text => 'BREAKFAST') 
    end

    it 'returns BRUNCH event' do
      expect(response.body)
          .to have_tag('a', :with => { :href => "/menus/by_event.BRUNCH" }, :text => 'BRUNCH') 
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /by_event' do
    before { get '/menus/by_event.brunch' }

    it 'returns records having event column equal to brunch' do
      expect(response.body)
          .to match(/brunch[.\<\>a-zA-Z\s\/]*COMMERCIAL/i)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
  
  describe 'GET /venues' do
    before { get '/menus/venues' }

    it 'returns COMMERCIAL venue' do
      expect(response.body)
          .to have_tag('a', :with => { :href => "/menus/by_venue.COMMERCIAL" }, :text => 'COMMERCIAL') 
    end

    it 'returns RESTAURANT venue' do
      expect(response.body)
          .to have_tag('a', :with => { :href => "/menus/by_venue.RESTAURANT" }, :text => 'RESTAURANT') 
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /by_venue' do
    before { get '/menus/by_venue.RESTAURANT' }

    it 'returns records having event column equal to RESTAURANT' do
      expect(response.body)
          .to match(/RESTAURANT[.\<\>a-zA-Z\s\/\;\&]*HOT SPRINGS, AR/i)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /places' do
    before { get '/menus/places' }

    it 'returns "HOT SPRINGS, AR" and "HOTEL GRAMERCY PARK"' do
      expect(response.body)
          .to match(/HOT SPRINGS, AR[.\<\>a-zA-Z\s\/\;\&]*HOTEL GRAMERCY PARK\; 52 GRAMERCY PARK NORTH/i)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end
