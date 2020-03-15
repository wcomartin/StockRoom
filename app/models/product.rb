class Product < ApplicationRecord
    validates :name, presence: true, length: {minimum: 5}

    has_many :sales_orders_products
    has_many :sales_orders, through: :sales_orders_products
end
