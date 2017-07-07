Rails.application.routes.draw do
  devise_for :users
  root :to => 'packages#index'

  resources :packages do
    resources :reviews
  end

end
