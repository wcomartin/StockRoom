class UpdateSalesOrderNumberType < ActiveRecord::Migration[5.1]
  def change
    change_column :sales_orders, :order_number, :integer
  end
end
