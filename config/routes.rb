Rails.application.routes.draw do

  root "articles#index"


  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    resources :articles do
      resources :comments, only: [:new, :create, :destroy]
    end
  end
end
