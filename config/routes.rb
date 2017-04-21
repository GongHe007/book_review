Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :books, except: [:destroy]
    resources :comments, except: [:destroy]
    resources :reply_comments, except: [:destroy]
  end

  resources :sessions, only: [:new] do
    collection do
      post :login
      delete :logout
    end
  end
end
