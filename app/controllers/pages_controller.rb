# frozen_string_literal: true

class PagesController < ApplicationController
  def index; end

  def faqs
    @email = 'info@kodak.sk'
  end

  def pricelist
    @photo_products_online = PhotoProduct.where(order_type: 'online_order')
    @photo_products_location = PhotoProduct.where(order_type: 'in_store_order')
  end

  def products; end
end
