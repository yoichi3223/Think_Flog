Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'
  get 'top/index'
  resources :lists, only: %i(new create edit update destroy show) do
  resources :cards, only: %i(new create show edit update destroy)
  end
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: %i(show edit update)
end
