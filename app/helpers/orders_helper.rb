# frozen_string_literal: true

module OrdersHelper
  def white_frame_options
    [['Yes', true], ['No', false]]
  end

  def delivery_method_select_options(order, locations)
    location_options = locations.map { |location| [location.name, location.id] }
    post_option = [['by post', Order::DELIVERY_METHOD_POST]]
    options_for_select(location_options + post_option, order.delivery_method_selection)
  end
end
