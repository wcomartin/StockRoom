class AddAddressToSalesOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :sales_orders, :address, :text
  end
end
