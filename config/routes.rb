Rails.application.routes.draw do
  # get "/", to: "welcome#home"
  # get "/", to: "blogs#index"
  root to: "blogs#index"
  get "/about", to: "welcome#about"

  # REST
  resources :blogs
  resources :articles
  resource :sessions, only: [:create, :destroy]

  resource :users, except: [:new, :destroy] do
    get :sign_up
    get :sign_in
  end
end
