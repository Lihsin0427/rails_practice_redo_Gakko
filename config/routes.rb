Rails.application.routes.draw do

  resources :courses
  
  root "courses#index"

  get "/sign_up" , to: "users#sign_up"
  post "/account_verify", to: "users#account_verify"

  get "/sign_in", to: "users#sign_in"
  post "/check", to: "users#check"

  delete "/sign_out", to: "users#sign_out"
end
