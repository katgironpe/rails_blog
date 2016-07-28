Rails.application.routes.draw do
  devise_for :users
  resources :posts
  devise_scope :user do
    get 'sign-in' => 'devise/sessions#new'
    get 'sign-out' => 'devise/sessions#destroy'
    get 'sign-up' => 'devise/registrations#new'
  end

  root to: 'home#index'
end
