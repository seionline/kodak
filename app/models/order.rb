# frozen_string_literal: true

class Order < ApplicationRecord
  SIZE_OPTIONS = [
    '9cm x 13cm',
    '10cm x 15cm',
    '13cm x 18cm',
    '15cm x 20cm',
    '15cm x 21cm',
    '20cm x 30cm',
    '30cm x 40cm',
    '30cm x 45cm'
  ].freeze
  SURFACE_OPTIONS = %w[glossy matte].freeze
  CONVERSION_OPTIONS = %w[fill_in fit_in].freeze
  PAYMENT_METHOD_OPTIONS = %w[advance pickup].freeze
  DELIVERY_METHOD_PICKUP = 'pickup'
  DELIVERY_METHOD_POST = 'post'
  DELIVERY_METHOD_OPTIONS = [DELIVERY_METHOD_PICKUP, DELIVERY_METHOD_POST].freeze
  STATUS_NEW = 'new'
  STATUS_PLACED = 'placed'
  STATUS_CLOSED = 'closed'
  STATUS = [STATUS_NEW, STATUS_PLACED, STATUS_CLOSED].freeze

  belongs_to :location, optional: true
  belongs_to :user, optional: true
  has_many :order_items, dependent: :destroy
  has_many :photos, through: :order_items

  validates :size, presence: true, inclusion: { in: SIZE_OPTIONS }
  validates :surface, presence: true, inclusion: { in: SURFACE_OPTIONS }
  validates :conversion, presence: true, inclusion: { in: CONVERSION_OPTIONS }
  validates :white_frame, inclusion: { in: [true, false] }
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :delivery_method, presence: true, inclusion: { in: DELIVERY_METHOD_OPTIONS }
  validates :payment_method, presence: true, inclusion: { in: PAYMENT_METHOD_OPTIONS }
  validates :location, presence: true, if: :pickup?
  validates :status, inclusion: { in: STATUS }

  def self.build!(photos)
    transaction do
      o = new
      o.save(validate: false)
      photos.each do |photo|
        p = Photo.create(attachment: photo)
        OrderItem.create(photo: p, order: o)
      end
      o
    end
  end

  def pickup?
    delivery_method == DELIVERY_METHOD_PICKUP
  end

  def delivery_method_selection
    if pickup?
      location.id
    else
      DELIVERY_METHOD_POST
    end
  end

  def new?
    status == STATUS_NEW
  end

  def placed?
    status == STATUS_PLACED
  end
end
