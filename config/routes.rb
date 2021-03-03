Rails.application.routes.draw do
  devise_for :users
  root to: "game_titles#index"
  resources :game_titles do
    resources :comments, only: :create
    resources :favorites, only: [:create, :destroy]
  end
end
