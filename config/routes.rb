Rails.application.routes.draw do
  devise_for :users
  get 'home/top' => 'home#top'
  get 'home/about' => 'home#about'
  root 'home#top' 
  resources :posts do
    resources :post_likes, only: [:create, :destroy]
  end
  resources :claimers do
    resources :c_likes, only: [:create, :destroy]
  end
end
