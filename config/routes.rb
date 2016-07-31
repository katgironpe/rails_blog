Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign-in' => 'devise/sessions#new'
    get 'sign-out' => 'devise/sessions#destroy'
    get 'sign-up' => 'devise/registrations#new'
  end

  namespace :admin do
    resources :posts, :users, :comments
  end

  resources :comments, :posts

  get '/post/:id/comments' => 'comments#index', post_id: nil, as:'post_comments'

  root to: 'posts#index'
end
