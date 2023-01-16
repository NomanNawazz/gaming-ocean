Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users
  ActiveAdmin.routes(self)
  resources :categories
  resources :games

  root 'games#index'
  resources :room_messages
  resources :rooms
  resources :comments

  get 'billing/index', as: :billing
  get '/card/new' => 'billing#new_card', as: :add_payment_method
  post "/card" => "billing#create_card", as: :create_payment_method
  get '/success' => 'billing#success', as: :success
  post '/subscription' => 'billing#subscribe', as: :subscribe


  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
