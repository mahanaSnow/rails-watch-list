Rails.application.routes.draw do
  root to: 'pages#home'
  get 'reviews/create'
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create]
    resources :reviews, only: [:create]
  end

  resources :bookmarks, only: [:destroy]
end
