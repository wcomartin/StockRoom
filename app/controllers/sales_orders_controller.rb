class SalesOrdersController < ApplicationController
  def index
    orders_query = SalesOrder.includes(:sales_order_products).includes(:products)
    @orders = orders_query.where(:order_status => :quote)
                  .or(orders_query.where(:order_status => :in_progress))
                  .or(orders_query.where(:order_status => :ready))
    #               .map do |order|
    #   order.total = order.sales_order_products.inject(0) do |sum, sop|
    #     qty = sop.qty || 0
    #     price = sop.product.sale_price || 0
    #     sum + qty * price
    #   end
    #   order
    # end

  end

  def show
    @order = SalesOrder.find(params[:id])

  end

  def edit
    @order = SalesOrder.includes(:sales_order_products).includes(:products).find(params[:id])
  end

  def new
    @order = SalesOrder.new
  end

  def create
    @order = SalesOrder.new(order_params)

    next_order_number = SalesOrder.order(order_number: :desc).select(:order_number).first
    @order.order_number = next_order_number.order_number + 1

    if @order.save
      redirect_to edit_sales_order_path(@order)
    else
      render 'new'
    end
  end

  def update
    @order = SalesOrder.find(params[:id])

    if @order.update(order_params)
      redirect_to edit_sales_order_path(@order, saved: true)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private def order_params
    params.require(:order).permit(:customer_name, :order_number, :address, :payment_method)
  end
end
