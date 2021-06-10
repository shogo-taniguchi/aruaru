Rails.application.routes.draw do
  get 'posts/index' => 'posts#index'
  root 'posts#index'
  get 'posts/new' => 'posts#new'
end
