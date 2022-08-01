Rails.application.routes.draw do
  # get "/", to: "welcome#home"
  get "/", to: "blogs#index"

  get "/about", to: "welcome#about"

  # REST
  resources :blogs
  resources :articles

end
