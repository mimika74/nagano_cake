class Admin::OrdersController < ApplicationController
  
  
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #@order.customer_id = current_customer.id
    #@cart_items = current_customer.cart_items
  end

  def update
    @customer = current_customer
    @order.status.update(:status, *[0..3])
    redirect_to order_path
  end


end
