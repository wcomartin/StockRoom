class RecalculateTotalsJob < ApplicationJob
  queue_as :default

  def perform(order_id)
    order = SalesOrder.find(order_id)

    order.sub_total = order.sales_order_products.inject(0) do |sum, sop|
      qty = sop.qty || 0
      price = sop.product.sale_price || 0
      sum + qty * price
    end

    order.tax_total = order.sub_total * 0.13

    order.total = order.sub_total - (order.discount_total || 0) + order.tax_total

    order.save
  end
end
