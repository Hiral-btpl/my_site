Rails.application.routes.draw do
  get 'homes/index'
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' } 
  resources :users do
    resources :articles
  end
  # root 'articles#index'
  root 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
