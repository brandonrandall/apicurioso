Rails.application.routes.draw do
  root "home#index"
  get "/github_dashboard", to: "github_dashboard#index"
  get "/auth/github", as: :github_login
  get "/auth/facebook", as: :facebook_login
  get "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  delete "/logout", to: "sessions#destroy"

  resources :repos, only: [:show] do
    resources :commits, only: [:index]
    # get "/:id/commits", to: "repos_commits#index"
  end
end
