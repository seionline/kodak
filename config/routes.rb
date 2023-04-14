# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/, defaults: { locale: I18n.default_locale } do
    # Defines the root path route ("/")
    root 'pages#index'
    get 'home', to: redirect('/')
    get 'faqs', to: 'pages#faqs'

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
    resources :orders, only: %i[new create]

    get 'log_in', to: redirect('/auth/session/new')
    get 'sign_up', to: redirect('/users/new')
    delete 'log_out', to: 'auth/sessions#destroy'
  end
end
