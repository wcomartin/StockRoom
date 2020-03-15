
class SalesOrdersProductsController < ApplicationController

  def create
    @params = params

    order = SalesOrder.find_by order_number: params["order_number"]

    unless order
      render :nothing => true, :status => :bad_request
    end

    product = Product.find(params["product_id"])

    unless product
      render :nothing => true, :status => :bad_request
    end

    order_product = SalesOrderProduct.new
    order_product.sales_order = order
    order_product.product = product
    order_product.qty = params["qty"]
    order_product.notes = params["notes"]
    order_product.save

    recalculate_totals order.id
  end

  def update
  end

  def destroy
  end

  private def recalculate_totals (order_id)
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