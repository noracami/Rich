Rails.application.routes.draw do
  get "/", to: "welcome#home"

  get "/about", to: "welcome#about"

  # get '/blog', to: "blog#index"
  # post '/blog/', to: "blog#create"
  # get '/blog/new', to: "blog#new"
  # get '/blog/:id', to: "blog#show"
  # get '/blog/:id/edit', to: "blog#edit"
  # patch '/blog/:id', to: "blog#update"
  # delete '/blog/:id', to: "blog#destory"

  # REST
  resources :blogs
  # resources :blog, only: [:index, :new]
  # resources :blog, except: [:index, :new]
end
