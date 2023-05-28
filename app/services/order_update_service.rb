# frozen_string_literal: true

class OrderUpdateService
  def initialize(order, params)
    @order = order
    @params = params
  end

  def perform
    if delivery_method.blank?
      order.errors.add(:delivery_method, t('errors.messages.blank'))
      return false
    end

    add_photos
    update_fields_and_save
  end

  private

  attr_reader :order, :params

  def update_fields_and_save
    ActiveRecord::Base.transaction do
      add_delivery_method_and_location
      order.assign_attributes(order_params)
      order.status = Order::STATUS_PLACED if order.new? && place_order?
      order.save
    end
  end

  def add_photos
    photo_keys = params[:order][:photos].compact_blank
    photo_keys.each { |pk| order.order_items.create!(photo: Photo.new(attachment: pk)) }
  end

  def add_delivery_method_and_location
    if delivery_method == Order::DELIVERY_METHOD_POST
      order.delivery_method = Order::DELIVERY_METHOD_POST
    else
      order.delivery_method = Order::DELIVERY_METHOD_PICKUP
      order.location = Location.find(delivery_method)
    end
  end

  def delivery_method
    @delivery_method ||= params[:order].delete(:delivery_method)
  end

  def order_params
    params.require(:order).permit(:size, :surface, :conversion, :white_frame, :amount, :payment_method,
                                  :special_requests)
  end

  def place_order?
    params[:commit] == I18n.t('orders.submit_place')
  end
end
