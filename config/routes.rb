Rails.application.routes.draw do
  root to: "blogs#index"
  get "/about", to: "welcome#about"

  # REST
  resources :blogs
  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy]
    member do
      patch :unlock
    end
  end
  resource :sessions, only: [:create, :destroy]

  resource :users, except: [:new, :destroy] do
    get :sign_up
    get :sign_in
  end
end
