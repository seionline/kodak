# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.0]
  enable_extension 'hstore' unless extension_enabled?('hstore')

  # rubocop:disable Metrics/MethodLength
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :street, null: false
      t.string :city, null: false
      t.string :postcode, null: false
      t.string :opening_hours
      t.hstore :description

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
end
