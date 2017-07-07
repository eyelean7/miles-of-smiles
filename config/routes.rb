Rails.application.routes.draw do

  root :to => 'packages#index'

  resources :packages do
    resources :reviews
  end
  
  devise_for :users
end
