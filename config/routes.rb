Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'pages#home'

  resources :study_groups do
    resources :sessions, only: [:new, :create]
  end
  # resources :sessions, only: [:show]
end
