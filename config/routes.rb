Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/home/about', to: 'homes#about', as: 'about'
  get '/homes/top', to: 'homes#top', as: 'top'
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
end
