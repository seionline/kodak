# frozen_string_literal: true

module User
  class EmailConfirmationsController < ApplicationController
    def new
      @email_confirmation = User::EmailConfirmation.new(email_confirmation_params)
    end

    def create
      user = User.find_by(email_confirmation_token: params.dig(:user_email_confirmation, :email_confirmation_token))

      if user&.update(email_confirmation_token: nil)
        redirect_to :home, notice: I18n.t('email_confirmations.create.success_notice')
      else
        redirect_to :home, alert: I18n.t('email_confirmations.create.failure_alert')
      end
    end

    def resend
      if helpers.logged_in? && helpers.current_user.start_email_confirmation
        redirect_to :home, notice: I18n.t('email_confirmations.resend.success_notice')
      else
        redirect_to :home, alert: I18n.t('email_confirmations.resend.failure_alert')
      end
    end

    private

    def email_confirmation_params
      params.require(:user_email_confirmation).permit(:email_confirmation_token)
    end
  end
end
