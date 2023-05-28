# frozen_string_literal: true

class AddDefaultStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    Order.where(status: nil).update_all(status: 'new') # rubocop:disable Rails/SkipsModelValidations

    change_column_default :orders, :status, from: nil, to: 'new'
    change_column_null :orders, :status, false
  end
end
