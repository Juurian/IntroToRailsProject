Rails.application.routes.draw do
  root "menus#index"

  resources :menus, only: [:index]
  resources :cheap_games, only: %i[index show]
  resources :free_games, only: [:index]
  resources :game_summaries, only: [:index]
  resources :giveaways, only: [:index]
  resources :abouts, only: [:index]
end
