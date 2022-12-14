Rails.application.routes.draw do
  get 'orders/show'
  get 'plans/show'
  root to: "pages#home"
  get "/about", to: "pages#about"

  scope "/@:handler" do
    resource :blogs, except: %i[ new create ]
  end

  resource :blogs, only: %i[ new create ]

  get "/@:handler/blogs/all", to: "articles#index"

  # REST
  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy]
    collection do
      get :search
    end
    member do
      patch :unlock
    end
  end

  resource :plans, only: [:show]

  resources :orders, except: [:edit, :update, :destroy] do
    member do
      get 'pay'
      post 'pay', action: 'submit_payment'
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
