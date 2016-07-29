Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign-in' => 'devise/sessions#new'
    get 'sign-out' => 'devise/sessions#destroy'
    get 'sign-up' => 'devise/registrations#new'
  end

  namespace :admin do
    resources :posts, :users
  end

  resources :posts

  root to: 'posts#index'
end
