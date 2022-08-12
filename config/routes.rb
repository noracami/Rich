Rails.application.routes.draw do
  root to: "pages#home"
  get "/about", to: "pages#about"

  scope "/@:handler" do
    resource :blogs, except: %i[ new create ]
  end

  resource :blogs, only: %i[ new create ]

  get "/@:handler/blogs/all", to: "articles#index"
  # get "/@:handler/blogs/:id", to: "articles#show"

  # REST
  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy]
    member do
      patch :unlock
    end
  end

  namespace :api do
    namespace :v1 do
      resources :articles, only: [] do
        post :like
      end
    end
  end

  resource :sessions, only: [:create, :destroy]

  resource :users, except: [:new, :destroy] do
    get :sign_up
    get :sign_in
  end

  get "/@:handler", to: "blogs#show"
end
