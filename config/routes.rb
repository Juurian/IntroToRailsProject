Rails.application.routes.draw do
  get "/abouts", to: "abouts#index"

  get "/menus", to: "menus#index"

  resources :deals, only: [:index]
  resources :good_deals
end
