class Public::OrdersController < ApplicationController

  def new
    @order = Order.new

    @customer_address = current_customer
    #@customer_address = Address.where(current_customer_id:current_customer.id)

  end

  def confirm

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    #@address = Address.find(params[:order][:address_id])
    #@address = Address.find(params[:address])
    @cart_items = current_customer.cart_items.all
    p @order.customer_id
    if params[:order][:address_id] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name

    elsif params[:order][:address_id] == "1"

      @order.postal_code = Address.find(params[:order][:address_number]).postal_code
      @order.address = Address.find(params[:order][:address_number]).address
      @order.name = Address.find(params[:order][:address_number]).name
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


    order = Order.new(order_params)
    cart_items = current_customer.cart_items
    if cart_items.exists?

      order.save
      cart_items.each do |cart_item|

      item = Item.find_by(id: cart_item.item_id)

      order_detail = OrderDetail.new(order_id: order.id, item_id: item.id, price: item.with_tax_price, amount: cart_item.amount)

      order_detail.save
      end
      cart_items.destroy_all
      redirect_to orders_complete_path

    else
      redirect_to new_order_path
    end

  end

  def complete
  end

  def index
   # @order.customer_id = current_customer.id
    #@cart_items = current_customer.cart_items
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])

    #@orders = current_customer.order
    #@order_details = OrderDetail.find(order_params)
    @order_details = @order.order_details

    #@order.customer_id = current_customer.id
    #@cart_items = current_customer.cart_items
  end

  private
  def order_params
  params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

  def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end





end
