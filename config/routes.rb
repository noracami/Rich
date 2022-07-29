Rails.application.routes.draw do
  get "/", to: "welcome#home"

  get "/about", to: "welcome#about"

  # REST
  resources :blogs
  resources :articles

end
