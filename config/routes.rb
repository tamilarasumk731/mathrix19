Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :colleges, only: [:index]
      resources :users, only: [:create]

      resources :workshops do
      	collection do
      		get '/pay', to: "workshops#register_workshop"
      		post '/update', to: "workshops#payment_update"
          get '/check_status', to: "workshops#check_status"
          put '/onspot_pay', to: "workshops#onspot_update"
      	end
      end
    end
  end
end
