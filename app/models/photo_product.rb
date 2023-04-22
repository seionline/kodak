# frozen_string_literal: true

class PhotoProduct < ApplicationRecord
  validates :name, :price1, :price2, :price3, presence: true
end
