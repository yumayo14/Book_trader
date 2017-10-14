Rails.application.routes.draw do

  devise_for :users
  root 'books#index'
  resources :users, only: :show
  resources :books do
    collection do
      get 'search' => 'books#search'
    end
    resources :comments, only: [:new, :create]
  end
  # get 'books' => 'books#index'

  # get 'comments' => 'comments#new'
  # post 'comments' => 'comments#create'

end
