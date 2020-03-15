class CreateSalesOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :sales_orders do |t|
      t.string :customer_name
      t.string :payment_method
      t.integer :order_status

      t.decimal :sub_total
      t.decimal :tax_total
      t.decimal :discount_total
      t.decimal :total

      t.date :bill_date
      t.date :order_date
      t.date :delivery_date

      t.text :notes

      t.timestamps
    end
  end
end
