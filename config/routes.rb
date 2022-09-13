Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :groups do
    resources :user_groups, only: [:create]
    resources :messages, only: :create
  end
  resources :users do
    member do
      post :follow
      post :unfollow
    end
    resources :reviews, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
