# frozen_string_literal: true

class Photo < ApplicationRecord
  has_one :order, through: :order_item
  has_many :order_items, dependent: :destroy

  has_one_attached :attachment
end
