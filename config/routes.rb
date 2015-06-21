Rails.application.routes.draw do
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :posts, concerns: :paginatable do
    resources :comments
  end
  
  root 'posts#index'
end
