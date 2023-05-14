# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#index'
  get 'home', to: redirect('/')
  get 'faqs', to: 'pages#faqs'
  get 'pricelist', to: 'pages#pricelist'
  get 'products', to: 'pages#products'

  resources :users, only: %i[new create]
  namespace :auth do
    resources :email_confirmations, only: %i[new create]
    namespace :email_confirmations do
      post :resend
    end
    resources :password_reset_requests, only: %i[new create]
    resources :password_resets, only: %i[new create]
    resource :session, only: %i[new create destroy]
  end

  resources :locations, only: %i[index]
  resources :orders, only: %i[new create edit update destroy]
  resources :photos, only: :destroy

  get 'log_in', to: redirect('/auth/session/new')
  get 'sign_up', to: redirect('/users/new')
  delete 'log_out', to: 'auth/sessions#destroy'
end
