Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"

  resources :users, only: [:new, :create]
  namespace :api do
    resources :books, only: [:index, :show] do
      collection do
        get :real_index
      end
    end
    resources :book_reviews, only: [:new, :index, :create, :show]
    resources :replies, only: [:create]
  end

  namespace :admin do
    resources :books, except: [:destroy]
    resources :comments, except: [:destroy]
    resources :book_reviews, except: [:destroy]
    resources :replies, except: [:destroy]
  end

  resources :sessions, only: [:new] do
    collection do
      post :login
      get :logout
    end
  end
end
