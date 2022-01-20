Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  # groups controller
  resources :groups

  # ads controller
  resources :ads do
    resources :comments
    resource :bookmark
  end

  # users could sign up multiple times
  resources :users

  # users can only make one session
  resource :session

  resource :account

  get "about", to: "pages#about"
  
  root "pages#home"
end
