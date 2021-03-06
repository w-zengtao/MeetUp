Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :meet_ups do
    scope module: :meet_ups, only: [:index, :show, :create] do
      resources :comments, only: [:create], shallow: true
    end
  end

  namespace :api do
    resources :sessions, only: [:create, :destroy]
    resources :meet_ups, only: [:index]
  end

  root "meet_ups#index"
end
