class Admin::OrdersController < ApplicationController



  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #@order.customer_id = current_customer.id
    #@cart_items = current_customer.cart_items
  end

  def update
    #@customer = current_customer
    @order = Order.find(params[:id])

    if @order.update(order_params)

     redirect_to admin_orders_show_path(@order.id)
    else
      render :show
    end
  end


  private
  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end


end
