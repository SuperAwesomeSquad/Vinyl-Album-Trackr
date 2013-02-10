Celluloid::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :albums
  root :to => "application#index"
end
