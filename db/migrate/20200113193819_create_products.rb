class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product
      t.string :color
      t.string :price

      t.timestamps
    end
  end
end
