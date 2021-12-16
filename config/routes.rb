Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :courses, only: []do
        member do
    # /api/v1/courses/:id/like
        post :like
        end
      end
    end
  end


  # course/id/buy
  resources :courses do
    member do
    get :buy
    end
    resources :reviews, only: [:create]
    resources :orders, only: [:create]  # POST /courses/2/orders
  end
  resources :reviews, only: [:destroy]
  
  root "courses#index"

  get "/sign_up" , to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"

  get "/sign_in", to: "users#sign_in"
  post "/check", to: "users#check"

  delete "/sign_out", to: "users#sign_out"
end
