# frozen_string_literal: true

module OrdersHelper
  def white_frame_options
    [['Yes', true], ['No', false]]
  end

  def delivery_method_options
    [Location.pluck(:name) + [Order::DELIVERY_METHOD_POST, Order::DELIVERY_METHOD_POST]]
  end
end
