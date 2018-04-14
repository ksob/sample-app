# frozen_string_literal: true

Rails.application.routes.draw do
  resources :menus, only: [:index] do
    collection do
      get "venues"
      get "events"
      get "places"
      get "by_venue.(:venue)" => :by_venue, as: "menus_by_venue"
      get "by_event.(:event)" => :by_event, as: "menus_by_event"
    end
  end

  root to: "menus#venues"

  get "/import" => "imports#index"
  post "/import_files" => "imports#import_files"
  get "/new_export" => "exports#index"
  get "/send_export" => "exports#send_export"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
