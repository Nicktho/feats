# == Route Map
#
#    Prefix Verb   URI Pattern               Controller#Action
#      root GET    /                         pages#home
#     login GET    /login(.:format)          session#new
#           POST   /login(.:format)          session#create
#           DELETE /login(.:format)          session#destroy
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
#     feats GET    /feats(.:format)          feats#index
#           POST   /feats(.:format)          feats#create
#  new_feat GET    /feats/new(.:format)      feats#new
# edit_feat GET    /feats/:id/edit(.:format) feats#edit
#      feat GET    /feats/:id(.:format)      feats#show
#           PATCH  /feats/:id(.:format)      feats#update
#           PUT    /feats/:id(.:format)      feats#update
#           DELETE /feats/:id(.:format)      feats#destroy
#

Rails.application.routes.draw do

  root to: 'pages#home'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/feats/complete/:id' => 'feats#complete', as: 'complete_feat'
  get '/feats/completed' => 'feats#show_completed', as: 'show_completed_feats'
  get '/feats/completed/clear' => 'feats#clear_feats', as: "clear_feats"

  resources :users
  resources :feats


  
end
