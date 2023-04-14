# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    if session[:order_id]
      redirect_to edit_order_path(session[:order_id])
      return
    end

    @order = Order.new
  end

  def create
    order = Order.build!(params[:order][:photos].reject(&:blank?))
    if order
      session[:order_id] = order.id
      redirect_to edit_order_path(order)
    else
      render :new
    end
  end

  def edit
    # TODO: authentication: check that this is actually the user's order (either authenticated user or user_id set in session)
    @order = Order.find(params[:id])
  end

  def update

  end
end
