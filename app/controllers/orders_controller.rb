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

  # def create
  #   order = Order.build!(params[:order][:photos].compact_blank)
  #   if order
  #     order.location = Location.first
  #     session[:order_id] = order.id
  #     redirect_to edit_order_path(order)
  #   else
  #     flash[:error] = t('errors.order_not_created')
  #     render :new
  #   end
  # end

  def update
    @order = Order.find(params[:id])
    @locations = Location.all

    if allowed_order?(@order)
      if update_order
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

  private

  def order_params
    params.require(:order).permit(:size, :surface, :conversion, :white_frame, :amount, :payment_method, :special_requests)
  end

  def allowed_order?(order)
    (order.user.present? && order.user == current_user) || session[:order_id] == order.id
  end

  def update_order
    if params[:order][:delivery_method].blank?
      @order.errors.add(:delivery_method, t('errors.messages.blank'))
      return false
    end

    ActiveRecord::Base.transaction do
      @order.assign_attributes(order_params)
      if params[:order][:delivery_method] == Order::DELIVERY_METHOD_POST
        @order.delivery_method = Order::DELIVERY_METHOD_POST
      else
        @order.delivery_method = Order::DELIVERY_METHOD_PICKUP
        @order.location = Location.find(params[:order][:delivery_method])
      end
      @order.save
      true
    end
  end
end
