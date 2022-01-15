class Public::OrdersController < ApplicationController

  def new
    @order = Order.new


    @customer_address = Address.where(current_customer_id:current_customer.id)

  end

  def confirm
    @order = Order.new(order_params)
    #@address = Address.find(params[:order][:address_id])
    #@address = Address.find(params[:address])


    if params[:order][:address_id] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

    elsif params[:order][:address_id] == "1"

      @order.postal_code = Address.find(params[:order][:id]).postal_code
      @order.address = Address.find(params[:order][:id]).address
      @order.name = Address.find(params[:order][:id]).name
    elsif params[:order][:address_id] == "2"
      @address = Address.new(address_params)
      @address.postal_code = params[:order][:postal_code]
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.customer_id = current_customer.id

      if @address.save
        @order.postal_code = @address.postal_code
        @order.address =  @address.address
        @order.name =  @address.name
      else
        render :new
      end


      #@order.postal_code = @address.postal_code
     # @order.address = @address.address
      #@order.name = @address.name
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
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def address_params
  params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end



end
