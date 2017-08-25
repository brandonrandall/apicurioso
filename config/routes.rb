Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  get "/dashboard", to: "dashboard#index"
  get "/auth/github", as: :github_login
  get "/auth/github/callback", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :repos, only: [:show] do
    resources :commits, only: [:index]
    # get "/:id/commits", to: "repos_commits#index"
  end
end
