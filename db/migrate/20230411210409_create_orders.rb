# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change # rubocop:disable Metrics/MethodLength
    create_table :orders do |t|
      t.string :size
      t.string :surface
      t.string :conversion
      t.boolean :white_frame, null: false, default: false
      t.integer :amount
      t.text :special_requests
      t.string :delivery_method
      t.string :payment_method
      t.string :status
      t.boolean :paid, null: false, default: false

      t.integer :location_id
      t.integer :user_id

      t.timestamps
    end
  end
end
