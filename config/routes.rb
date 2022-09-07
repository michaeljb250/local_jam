Rails.application.routes.draw do
  post 'follows/create'
  get 'follows/index'
  get 'follows/destroy'
  get 'follows/show'
  get 'follows/new'
  get 'reviews/create'
  get 'reviews/index'
  get 'reviews/destroy'
  get 'reviews/show'
  get 'reviews/new'
  get 'groups/create'
  get 'groups/index'
  get 'groups/update'
  get 'groups/destroy'
  get 'groups/show'
  get 'groups/edit'
  get 'groups/new'
  get 'users/follow'
  get 'users/unfollow'
  get 'users/index'
  get 'users/show'
  devise_for :users
  root to: "pages#home"
  resources :groups
  resources :user_groups
  resources :users do
    member do
      post :follow
      post :unfollow
    end
    resources :reviews, only: [ :new, :create ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
