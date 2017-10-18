Rails.application.routes.draw do
  localized do
    devise_for :users

    #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'homepage#index'

    post '/listings/contact', to: 'listings#contact', as: 'listing_contact'

    #apipie
    resources :listings
  end
end
