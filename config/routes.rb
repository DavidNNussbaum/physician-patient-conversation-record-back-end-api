Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :conversations, except: [:index]
  resources :patients do 
    resources :conversations, only: [:index]
  end
  get "/current_user", to: "current_user#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
 
