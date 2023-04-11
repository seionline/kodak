# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :orders, dependent: :nullify

  validates :name, :email, :phone, :street, :city, :postcode, presence: true
end
