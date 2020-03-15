class AddSalesOrderInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_orders, :order_number, :string
  end
end
