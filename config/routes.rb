Rails.application.routes.draw do
  get 'orders/show'
  get 'plans/show'
  root to: "pages#home"
  get "/about", to: "pages#about"

  get "/@:handler/blogs/", to: "blogs#show", as: "blog"
  get "/@:handler/blogs/all", to: "articles#index"
  get "/@:handler/blogs/:id", to: "articles#show"

  # REST
  resources :blogs, except: %i[ show index ]
  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy]
    member do
      patch :unlock
    end
  end

  resource :plans, only: [:show]

  resources :orders, except: [:edit, :update, :destroy] do
    member do
      delete :cancel
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
