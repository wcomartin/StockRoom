class SalesOrder < ApplicationRecord
  enum payment_method: [:cheque, :cash, :visa, :mastercard, :paypal, :e_transfer]
  enum order_status: [:cancelled, :quote, :in_progress, :ready, :delivered]

  has_many :sales_order_products
  has_many :products, through: :sales_order_products
end

class SalesOrderProduct < ApplicationRecord

  belongs_to :product
  belongs_to :sales_order

end