# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_many :photos, through: :order_items

  def self.build!(photos)
    transaction do
      o = create
      photos.each do |photo|
        p = Photo.create(attachment: photo)
        OrderItem.create(photo: p, order: o)
      end
      o
    end
  end
end
