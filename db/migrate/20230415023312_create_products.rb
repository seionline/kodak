class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.hstore :name, null: false
      t.hstore :description
      t.float :price, null: false
      t.string :product_type, null: false

      t.timestamps
    end
  end
end
