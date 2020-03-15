
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

    RecalculateTotalsJob.perform_later order.id
  end

  def update
  end

  def destroy
  end

end