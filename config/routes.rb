Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    confirmations: 'confirmations'
  }, path_names: {
    sign_in: 'log_in',
    sign_up: 'create_account',
    sign_out: 'logout'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:new, :create, :destroy] do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

  resources :comments, only: [:destroy]

  namespace :api , defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
