Rails.application.routes.draw do


  resources :listing_assets, only: [:index,:new, :create, :show]
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 
 
  get '/account',  to: 'account#index'
  
  get '/adjust',   to: 'adjust#index'
  get '/adjust/edit',  to: 'adjust#edit'
  get '/adjust/show',  to: 'adjust#show'
  post '/adjust/create', to: 'adjust#create'
  get 'adjust/index'

  get '/user/history', to: 'asset_histories#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
