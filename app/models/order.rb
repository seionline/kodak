# frozen_string_literal: true

class Order < ApplicationRecord
  SIZES = [
    '9cm x 13cm',
    '10cm x 15cm',
    '13cm x 18cm',
    '15cm x 20cm',
    '15cm x 21cm',
    '20cm x 30cm',
    '30cm x 40cm',
    '30cm x 45cm'
  ].freeze

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
