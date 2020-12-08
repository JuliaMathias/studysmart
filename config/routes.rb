Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  root to: 'pages#home'

  get '/profile', to: 'pages#profile'
  get '/stash', to: 'pages#stash'

  resources :study_groups do
    resources :sessions, only: [:new, :create, :destroy]
  end

  resources :sessions, only: [:show, :edit, :update, :destroy] do
    resources :attachments, only: [:create]
  end
end
