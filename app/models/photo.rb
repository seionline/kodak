# frozen_string_literal: true

class Photo < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_one_attached :attachment do |attachable|
    attachable.variant :thumb, resize_to_limit: [200, 200]
  end
end
