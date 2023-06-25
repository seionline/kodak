# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :size
      t.string :surface
      t.boolean :white_frame, null: false, default: false
      t.integer :amount

      t.integer :order_id
      t.integer :photo_id

      t.timestamps
    end
  end
end
