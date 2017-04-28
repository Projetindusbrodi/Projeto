Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'produtos#index'
  scope 'admin' do
    resources :alunos
    resources :produtos
  end
end
