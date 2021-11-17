Rails.application.routes.draw do
  get'/', to:'pages#index'

  get'/sign_up', to:'users#sign_up'
  post'/account_verify', to:'users#account_verify'
end
