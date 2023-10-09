Rails.application.routes.draw do
  root "menus#index"

  resources :menus, only: [:index]
  resources :abouts, only: [:index]
  resources :cheap_games, only: [:index]
  resources :game_summaries, only: [:index]
end
