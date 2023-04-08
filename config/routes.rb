# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#index'

  resources :users, only: %i[new create]
  namespace :user do
    resources :email_confirmations, only: %i[new create]
    namespace :email_confirmations do
      post :resend
    end
    resources :password_reset_requests, only: %i[new create]
    resources :password_resets, only: %i[new create]
  end

  resource :user_session, only: %i[new create destroy]

  get 'log_in', to: redirect('/user_session/new')
  get 'sign_up', to: redirect('/users/new')
  delete 'log_out', to: 'user_sessions#destroy'

  get 'home', to: redirect('/')
end
