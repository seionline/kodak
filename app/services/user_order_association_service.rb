class UserOrderAssociationService
  def initialize(user, order_id)
    @user = user
    @order_id = order_id
  end

  def perform
    return if user.blank?
    return if order_id.blank?

    Order.find(order_id).update(user: user)
  end

  private

  attr_reader :user, :order_id
end
