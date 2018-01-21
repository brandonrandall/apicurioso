Rails.application.routes.draw do
  root "home#index"
  get "/github_dashboard", to: "github_dashboard#index"
  get "/facebook_dashboard", to: "facebook_dashboard#index"
  get "/auth/github", as: :github_login
  get "/auth/facebook", as: :facebook_login
  get "/auth/github/callback", to: "sessions#github_create"
  get "/auth/facebook/callback", to: "sessions#facebook_create"
  delete "/logout", to: "sessions#destroy"

  resources :repos, only: [:show] do
    resources :commits, only: [:index]
  end
end
