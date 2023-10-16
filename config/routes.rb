Rails.application.routes.draw do
  root "cheap_games#index"

  # resources :menus, only: [:index]
  resources :cheap_games, only: %i[index show]
  resources :free_games, only: %i[index show]
  resources :game_summaries, only: [:index]
  resources :giveaways, only: %i[index show]
  resources :abouts, only: [:index]

  get "/search", to: "search#search", as: "search"
end
