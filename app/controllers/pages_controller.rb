# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @locations = Location.all
    render layout: 'index'
  end

  def faqs
    @email = 'info@kodak.sk'
  end

  def pricelist
    @photo_products_online = PhotoProduct.where(order_type: 'online_order')
    @photo_products_location = PhotoProduct.where(order_type: 'in_store_order')
    @scan_products = Product.where(product_type: 'scan')
    @film_development_products = Product.where(product_type: 'film_development')
    @present_products = Product.where(product_type: 'presents')
    @photo_id_products = Product.where(product_type: 'photo_id')
  end

  def products; end
end
