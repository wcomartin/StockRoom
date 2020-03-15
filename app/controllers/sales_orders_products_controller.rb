
class SalesOrdersProductsController < ApplicationController

  def create
    @params = params

    order = SalesOrder.find_by order_number: params["order_number"]

    if !order
      render :nothing => true, :status => :bad_request
    end

    product = Product.find(params["product_id"])

    if !product
      render :nothing => true, :status => :bad_request
    end

    order_product = SalesOrderProduct.new
    order_product.sales_order = order
    order_product.product = product
    order_product.qty = params["qty"]
    order_product.notes = params["notes"]
    order_product.save

    # calculate_totals order
  end

  def update
    # @order = SalesOrder.find(params[:id])
    #
    # if @order.update(order_params)
    #   redirect_to @order
    # else
    #   render 'edit'
    # end
  end

  def destroy
  end

  private def order_params
    # params.require(:order).permit(:part_number, :qty)
  end

  # private def calculate_totals (order)
  #   total = 0
  #   order.products.each { |product| total += product.qty * product.sales_price }
  #   order.save
  # end

end