Rails.application.routes.draw do
  resources :posts
  resource :comments, only: [:create, :update, :destroy]

  root 'posts#index'
end
