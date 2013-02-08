Celluloid::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :albums do
    collection do
      get 'search'
    end
  end
  root :to => "application#index"
end
