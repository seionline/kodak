# frozen_string_literal: true

module Auth
  class SessionsController < ApplicationController
    def new; end

    def create
      user = User.find_by(email: params[:auth_session][:email])

      if user&.authenticate(params[:auth_session][:password])
        handle_successful_login(user)
      else
        @error = true
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      session[:current_user_id] = nil
      redirect_to :home
    end

    private

    def handle_successful_login(user)
      if user.email_confirmed?
        session[:current_user_id] = user.id

        # When logging in successfully, associate the order id in the session (if any) with the logged in user
        UserOrderAssociationService.new(user, session[:order_id], session).perform
        redirect_to :home
      else
        @error = true
        render :new, status: :unprocessable_entity
      end
    end
  end
end
