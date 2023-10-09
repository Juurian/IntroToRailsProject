Rails.application.routes.draw do
  root "gaming_on_a_budget#index"

  get "/gaming_on_budget", to: "gaming_on_a_budget#index"
end
