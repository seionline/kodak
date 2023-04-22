# frozen_string_literal: true

class FixOrders < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :amount, from: nil, to: 1
  end
end
