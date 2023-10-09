<<<<<<< Updated upstream
Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
=======
Rails.application.routes.draw do
  root "menus#index"

  resources :abouts, only: [:index]
  resources :menus, only: [:index]
  resources :deals, only: [:index]
  resources :good_deals, only: [:index]
  resources :game_summaries, only: [:index]
end
>>>>>>> Stashed changes
