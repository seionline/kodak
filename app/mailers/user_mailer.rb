# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def email_confirmation_email
    @user = params[:user]
    @email_confirmation_url = new_auth_email_confirmation_url(
      auth_email_confirmation: { email_confirmation_token: @user.email_confirmation_token }
    )
    mail(to: @user.email, subject: I18n.t('auth.email_confirmations.new.email_subject'))
  end

  def password_reset_email
    @user = params[:user]
    @password_reset_url = new_auth_password_reset_url(
      auth_password_reset: { password_reset_token: @user.password_reset_token }
    )
    mail(to: @user.email, subject: I18n.t('auth.password_reset_requests.new.email_subject'))
  end
end
