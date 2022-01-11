class Public::OrdersController < ApplicationController

  def new
    @order = Order.new


    @customer_address = current_customer.address


  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])

    if address_id == "0"
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    elsif address_id == "1"
      
    else
    end


  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end

  private
  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status, :address_id)
  end


end
