Rails.application.routes.draw do
  root 'static_pages#home'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login'   => 'sessions#new'
  post 'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  resources :words, only: [:index]
  resources :categories, only: [:index] do
    resources :lessons, only: [:new, :create, :show]
  end

  namespace :admin do
    root 'categories#index'
    resources :categories, except: [:show] do
      resources :words, except: [:show]
    end
    resources :users, except: [:show]
  end
end
