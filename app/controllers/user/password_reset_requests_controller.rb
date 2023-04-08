# frozen_string_literal: true

class User::PasswordResetRequestsController < ApplicationController
  def new
    @password_reset_request = User::PasswordResetRequest.new
  end

  def create
    email = password_reset_request_params[:email]
    user = User.where(email: email)

    user&.start_password_reset

    redirect_to :home, notice: 'Please click the password reset link in the email you will receive momentarily.'
  end

  private

  def password_reset_request_params
    params.require(:user_password_reset_request).permit(:email)
  end
end
