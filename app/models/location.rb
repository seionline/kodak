# frozen_string_literal: true

class Location < ApplicationRecord
  validates :name, :email, :phone, :street, :city, :postcode, presence: true
end
