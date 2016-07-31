Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign-in' => 'devise/sessions#new'
    get 'sign-out' => 'devise/sessions#destroy'
    get 'sign-up' => 'devise/registrations#new'
  end

  namespace :admin do
    resources :posts, :users, :comments, :articles
  end

  resources :comments, :posts, :articles

  get 'post/:post_id/comments' => 'comments#index', post_id: nil, as:'post_comments'
  get 'article/:article_id/comments' => 'comments#index', article_id: nil, as:'article_comments'
  get 'tags/:resource_type/:name' => 'tags#index', as: 'tags'

  root to: 'posts#index'
end
