# frozen_string_literal: true

module Auth
  class PasswordResetRequest
    include ActiveModel::Model

    attr_accessor :email_or_username
  end
end
