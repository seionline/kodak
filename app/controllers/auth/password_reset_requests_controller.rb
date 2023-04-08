# frozen_string_literal: true

module Auth
  class PasswordResetRequestsController < ApplicationController
    def new
      @password_reset_request = User::PasswordResetRequest.new
    end

    def create
      email = password_reset_request_params[:email]
      user = User.where(email:)

      user&.start_password_reset

      redirect_to :home, notice: I18n.t('auth.password_reset_requests.create.success_notice')
    end

    private

    def password_reset_request_params
      params.require(:user_password_reset_request).permit(:email)
    end
  end
end
