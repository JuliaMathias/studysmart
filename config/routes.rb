Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'

  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end

  resources :study_groups do
    resources :sessions, only: [:new, :create]
  end
  resources :sessions, only: [:show] do
    resources :attachments, only: [:create]
  end
end
