# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string 'email_confirmation_token'
      t.string :password_digest, null: false
      t.string 'password_reset_token'
      t.string :phone
      t.string :role, null: false, default: 'customer'

      # Address
      t.string :street
      t.string :city
      t.string :postcode

      t.index ['email'], name: 'index_users_on_email', unique: true

      t.timestamps
    end
  end
end
