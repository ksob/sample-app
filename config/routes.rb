Rails.application.routes.draw do
  resources :menus, only: [:index] do
    collection do
      get 'venues'
      get 'events'
      get 'by_venue.(:venue)' => :by_venue, as: 'menus_by_venue'
    end
  end

  root :to => "menus#venues"

  get '/import' => 'imports#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
