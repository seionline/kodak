# frozen_string_literal: true

module Auth
  class PasswordResetsController < ApplicationController
    def new
      @password_reset = User::PasswordReset.new(password_reset_params)
    end

    def create
      user = User.find_by(password_reset_token: password_reset_params[:password_reset_token])

      if user&.update(user_password_params) && user&.update(password_reset_token: nil)
        # TODO: Should we inform the user by email that their password has been changed, in case it wasn't them?
        redirect_to :home, notice: I18n.t('auth.password_resets.create.success_notice')
      else
        redirect_to :home, alert: I18n.t('auth.password_resets.create.failure_alert')
      end
    end

    private

    def password_reset_params
      params.require(:user_password_reset).permit(:password_reset_token)
    end

    def user_password_params
      params.require(:user_password_reset).permit(:password, :password_confirmation)
    end
  end
end
