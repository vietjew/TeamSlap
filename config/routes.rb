Rails.application.routes.draw do
  root to: "sessions#new"

  resources :leagues do
    resources :team_adds, only: [:create, :destroy]
    resources :games
  end
  
  resources :teams do
    resources :roster_adds, only: [:create, :destroy, :new]
  end
  
  resources :users
  resources :availabilities
  
  resource :session, only: [:create, :new, :destroy]
end
