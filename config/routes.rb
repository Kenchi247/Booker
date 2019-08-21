Rails.application.routes.draw do
  devise_for :users
  root 'books#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  get 'home/about' => 'books#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
