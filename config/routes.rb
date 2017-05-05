Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/produtos#index'
  namespace :admin do
    resources :users
    resources :produtos
  end
  resources :produtos, only: [:index, :show]
  resource :shopping_cart, only: [:show]
  resource :payments, only: [:create, :show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :notifications, only: [:create]
end
