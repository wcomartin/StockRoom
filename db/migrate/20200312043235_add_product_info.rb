class AddProductInfo < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :part_number, :string
    add_column :products, :purchase_price, :decimal
    add_column :products, :sale_price, :decimal
    add_column :products, :qty, :integer
  end
end
