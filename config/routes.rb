Rails.application.routes.draw do
  get '/blog', to: "blog#index"
  get '/blog/new', to: "blog#new"
  post '/blog/', to: "blog#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get("/", {to: "welcome#home"})
  get "/", to: "welcome#home"
  get "/about", to: "welcome#about"
end
