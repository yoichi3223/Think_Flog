Rails.application.routes.draw do
  get 'genres/index'
  get 'genres/edit'
  root 'homes#top'
  get 'homes/about'
  get 'top/index'
  get  'contact/form' => 'messages#index', as: 'contact/form'
  post 'contact/confirm' => 'messages#confirm', as: 'contact/confirm'
  post 'contact/done' => 'messages#done', as: 'contact/done'
  resources :lists, only: %i(new create edit update destroy show) do
    resources :cards, only: %i(new create show edit update destroy)
  end
  resources :genres
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: %i(show edit update) do
    resources :genres
  end
end
