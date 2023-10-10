Rails.application.routes.draw do
  root "menus#index"

  resources :abouts, only: [:index]
  resources :menus, only: [:index]
  resources :deals, only: [:index]
  resources :good_deals, only: [:index]
  resources :free_games, only: [:index]
  resources :giveaways, only: [:index]
  resources :game_summaries, only: [:index]
end
