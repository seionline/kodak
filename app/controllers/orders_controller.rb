# frozen_string_literal: true

class OrdersController < ApplicationController
  def new
    @order = Order.new
  end
end
