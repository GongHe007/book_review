Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"

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
