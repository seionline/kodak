# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    if session[:order_id]
      redirect_to edit_order_path(session[:order_id])
      return
    end

    order = Order.new.tap { |o| o.save(validate: false) }
    session[:order_id] = order.id
    redirect_to edit_order_path(order)
  end

  def edit # rubocop:disable Metrics/MethodLength
    @order = Order.find_by(id: params[:id])

    if @order.nil?
      # this probably means that the order in the user session has been deleted,
      # thus we should delete it from the session too...
      session[:order_id] = nil
      redirect_to new_order_path
    else
      @locations = Location.all

      if allowed_order?(@order)
        render :edit
      else
        flash[:error] = t('errors.order_not_allowed')
        redirect_to root_path
      end
    end
  end

  def update
    @order = Order.find(params[:id])
    @locations = Location.all

    if allowed_order?(@order)
      if update_order
        if params[:commit] == I18n.t('orders.submit_place')
          # TODO: actually place order?
        end

        flash[:success] = t('success.order_updated')
        redirect_to root_path
      else
        flash.now[:error] = t('errors.order_not_updated')
        render :edit
      end
    else
      flash[:error] = t('errors.order_not_allowed')
      render :edit
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy!
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:size, :surface, :conversion, :white_frame, :amount, :payment_method,
                                  :special_requests)
  end

  def update_order
    delivery_method = params[:order].delete(:delivery_method)

    if delivery_method.blank?
      @order.errors.add(:delivery_method, t('errors.messages.blank'))
      return false
    end

    photo_keys = params[:order][:photos].compact_blank
    photo_keys.each { |pk| @order.order_items.create!(photo: Photo.new(attachment: pk)) }

    ActiveRecord::Base.transaction do
      @order.assign_attributes(order_params)
      if delivery_method == Order::DELIVERY_METHOD_POST
        @order.delivery_method = Order::DELIVERY_METHOD_POST
      else
        @order.delivery_method = Order::DELIVERY_METHOD_PICKUP
        @order.location = Location.find(delivery_method)
      end
      @order.save
      true
    end
  end
end
