class CreatePhotoProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_products do |t|
      t.string :name
      t.float :price1
      t.float :price2
      t.float :price3
      t.string :order_type

      t.timestamps
    end
  end
end
