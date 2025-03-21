Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get "/home/about" => 'home#about'

  resources :users, only: [:index, :show, :edit, :update, :destroy]  
  resources :books, only: [:new, :create, :edit,:index, :show, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
