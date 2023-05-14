Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/users/sign_in', to: 'devise/sessions#new', as: 'login'
  
  get '/home/about', to: 'homes#about', as: 'about'
  get '/homes/top', to: 'homes#top', as: 'top'
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update]
end
