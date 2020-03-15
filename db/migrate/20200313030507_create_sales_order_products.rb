class CreateSalesOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_order_products do |t|
      t.integer :qty
      t.decimal :sales_price
      t.decimal :discount

      t.references :product, foreign_key: true
      t.references :sales_order, foreign_key: true

      t.text :notes

      t.timestamps
    end
  end
end
