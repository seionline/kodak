# frozen_string_literal: true

require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, confirmation: true
  validates :first_name, :last_name, :email, :role, :password_digest, presence: true

  attr_accessor :email_confirmation

  def name
    [first_name, last_name].compact.join(' ')
  end

  def start_email_confirmation
    return unless update(email_confirmation_token: SecureRandom.alphanumeric(20))

    UserMailer.with(user: self).email_confirmation_email.deliver_later
  end

  def start_password_reset
    return unless update(password_reset_token: SecureRandom.alphanumeric(20))

    UserMailer.with(user: self).password_reset_email.deliver_later
  end

  def email_confirmed?
    email_confirmation_token.blank?
  end
end
