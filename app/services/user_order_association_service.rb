# frozen_string_literal: true

class UserOrderAssociationService
  def initialize(user, order_id, session)
    @user = user
    @order_id = order_id
    @session = session
  end

  def perform
    return if user.blank?
    return if order_id.blank?

    return unless Order.find(order_id).update(user:)

    session[:order_id] = nil
  end

  private

  attr_reader :user, :order_id, :session
end
