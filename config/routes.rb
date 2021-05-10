Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # long way: for the custom routes ex. search
  # get "/songs", to: "songs#index" # controller/action (bundle exec rails routes)
  # get "/songs/:id", to: "songs#show"
  # post "/songs", to: "songs#create"
  # patch "/songs/:id", to: "songs#update"
  # delete "/songs/:id", to: "songs#destroy"

  # # short way:
  # resources :songs # -> creates routes for all actions, unless specified as below
  # # resources :songs, only: [:index, :create, :update, :destroy, :show, :new, :edit] # ACTION names** 
  # # resources :songs, except: [:new, :edit] 
  # resources :users
  # resource :session, only: [:new, :create, :destroy]

  root to: 'static_pages#root'
  # get "/", to: "static_pages#root"

  namespace :api, defaults: {format: :json} do
    resources :songs, only: [ :index, :create, :show ]
    resources :users
  end

end
