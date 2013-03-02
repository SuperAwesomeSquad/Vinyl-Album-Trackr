Celluloid::Application.routes.draw do
  devise_for :users

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :albums do
    collection do
      post 'discogs_search'
      get 'discogs_search'
      get 'search'
    end
  end
  root :to => "application#index"

  get '/sharkfarts',
  :to => 'sharkfarts#index',
  :as => 'sharkfarts'

end
#== Route Map
# Generated on 11 Feb 2013 16:50
#
#      batch_action_admin_albums POST       /admin/albums/batch_action(.:format)      admin/albums#batch_action
#                   admin_albums GET        /admin/albums(.:format)                   admin/albums#index
#                                POST       /admin/albums(.:format)                   admin/albums#create
#                new_admin_album GET        /admin/albums/new(.:format)               admin/albums#new
#               edit_admin_album GET        /admin/albums/:id/edit(.:format)          admin/albums#edit
#                    admin_album GET        /admin/albums/:id(.:format)               admin/albums#show
#                                PUT        /admin/albums/:id(.:format)               admin/albums#update
#                                DELETE     /admin/albums/:id(.:format)               admin/albums#destroy
#                admin_dashboard            /admin/dashboard(.:format)                admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format) admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)              admin/admin_users#index
#                                POST       /admin/admin_users(.:format)              admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)          admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)     admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)          admin/admin_users#show
#                                PUT        /admin/admin_users/:id(.:format)          admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)          admin/admin_users#destroy
#    batch_action_admin_comments POST       /admin/comments/batch_action(.:format)    admin/comments#batch_action
#                 admin_comments GET        /admin/comments(.:format)                 admin/comments#index
#                                POST       /admin/comments(.:format)                 admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)             admin/comments#show
#         new_admin_user_session GET        /admin/login(.:format)                    active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                    active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                   active_admin/devise/sessions#destroy
#            admin_user_password POST       /admin/password(.:format)                 active_admin/devise/passwords#create
#        new_admin_user_password GET        /admin/password/new(.:format)             active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)            active_admin/devise/passwords#edit
#                                PUT        /admin/password(.:format)                 active_admin/devise/passwords#update
#                  search_albums GET        /albums/search(.:format)                  albums#search
#                         albums GET        /albums(.:format)                         albums#index
#                                POST       /albums(.:format)                         albums#create
#                      new_album GET        /albums/new(.:format)                     albums#new
#                     edit_album GET        /albums/:id/edit(.:format)                albums#edit
#                          album GET        /albums/:id(.:format)                     albums#show
#                                PUT        /albums/:id(.:format)                     albums#update
#                                DELETE     /albums/:id(.:format)                     albums#destroy
#                           root            /                                         application#index
#                   rails_routes            /rails/routes(.:format)                   sextant/routes#index
#                 sextant_engine            /sextant                                  Sextant::Engine
#
# Routes for Sextant::Engine:
