Celluloid::Application.routes.draw do
  root :to => "albums#index"
  resources :albums
end
