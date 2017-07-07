Rails.application.routes.draw do
  resources :packages do
    resources :reviews
  end
end
