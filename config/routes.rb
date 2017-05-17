Rails.application.routes.draw do
  # resources :shopping_carts
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'admin/produtos#index'

  namespace :admin do
    resources :users
    resources :produtos
    resources :departments
  end
  resources :produtos, only: [:index, :show]
  resource :shopping_cart, only: [:show], as: :shopping_cart, on: :collection
  resource :payments, only: [:create, :show]
  resources :shopping_cart_items, only: [:create, :update, :destroy]
  resources :notifications, only: [:create]
  resources :departments, only: [:index]
  resources :orders, only: [:show, :index]
end
