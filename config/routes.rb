Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'home/top' => 'home#top'
  get 'home/about' => 'home#about'
  root 'home#top' 
  resources :posts do
    resources :post_likes, only: [:create, :destroy]
    resources :p_comments, only: [:create]
  end
  resources :claimers do
    resources :c_likes, only: [:create, :destroy]
    resources :c_comments, only: [:create]
  end
end
