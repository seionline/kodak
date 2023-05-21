# frozen_string_literal: true

module Auth
  class PasswordResetsController < ApplicationController
    def new
      @password_reset = Auth::PasswordReset.new(password_reset_params)
    end

    def create
      user = User.find_by(password_reset_token: password_reset_params[:password_reset_token])

      if user&.update(auth_password_params) && user&.update(password_reset_token: nil)
        # TODO: Should we inform the user by email that their password has been changed, in case it wasn't them?
        redirect_to :home, notice: I18n.t('auth.password_resets.create.success_notice')
      else
        @password_reset = Auth::PasswordReset.new(password_reset_params)
        # TODO: show errors of password reset form (non-matching passwords)
        render :new, status: :unprocessable_entity, alert: I18n.t('auth.password_resets.create.failure_alert')
      end
    end

    private

    def password_reset_params
      params.require(:auth_password_reset).permit(:password_reset_token)
    end

    def auth_password_params
      params.require(:auth_password_reset).permit(:password, :password_confirmation)
    end
  end
end
