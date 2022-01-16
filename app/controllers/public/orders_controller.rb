class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

    @customer_address = current_customer
    #@customer_address = Address.where(current_customer_id:current_customer.id)

  end

  def confirm
    @order = Order.new(order_params)
    #@address = Address.find(params[:order][:address_id])
    #@address = Address.find(params[:address])
    @cart_items = current_customer.cart_items.all

    if params[:order][:address_id] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

    elsif params[:order][:address_id] == "1"

      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:address_id] == "2"
      @address = Address.new
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id


    if  @order.save
      @order_detail = OrderDetail.new

      if @order_detail.save
      redirect_to orders_complete_path
      else
      render :new
      end
    else
      redirect_to new_orders_path
    end
  end

  def complete
    @order = Order.find(params[:id])
    @order.customer_id = current_customer.id


  end

  def index
    @order = current_customer.order.all
    @cart_items = current_customer.cart_items

  end

  def show
    @order = Order.find(params[:id])
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
  end

  private
  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end





end
