# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :photos, through: :order_items
end
