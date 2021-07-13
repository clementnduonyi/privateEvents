Rails.application.routes.draw do
  devise_for :users, :controllers => { registratins: "registrations" }
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
  authenticated :user do
    root to: "users#show", as: :authenticated_root
  end
  
end
