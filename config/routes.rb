Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"

  namespace :api do
    resources :users, only: [:new, :create]
    resources :books, only: [:index, :show]
    resources :book_reviews, only: [:new, :create, :show]
    resources :replies, only: [:create]
  end

  namespace :admin do
    resources :books, except: [:destroy]
    resources :comments, except: [:destroy]
    resources :reply_comments, except: [:destroy]
  end

  resources :sessions, only: [:new] do
    collection do
      post :login
      get :logout
    end
  end
end
