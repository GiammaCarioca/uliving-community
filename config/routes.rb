Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :ads do
    resources :comments
    resource :bookmark
  end

  resources :users

  resource :session

  resource :account

  get "about", to: "pages#about"
  
  root "pages#home"
end
