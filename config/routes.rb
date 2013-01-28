Celluloid::Application.routes.draw do
  root :to => "discogs#index"
  resources :albums
end
