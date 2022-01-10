class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!,except: [:index]

  def index
    #@cart_items = current_customer.cart_items.all
    @cart_items = CartItem.all




    #@total = @cart_items.inject(0) { |sum, item| sum + @item.price * amount }
  end

  def create

    #@cart_items = current_customer.cart_items.build(item_id: params[:item_id])
    #@cart_item = @item.cart_items.build(params[:id])
    #@cart_items.amount += params[:amount].to_i
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id

    #cart.cart_item.create!(item_id: item.id)
    if  @cart_item.save!
      flash[:notice] = '商品が追加されました。'
      redirect_to items_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to items_path
    end
  end

  def update
    if @cart_item.update(amount: params[:amount].to_i)
      flash[:notice] = 'カート内のギフトが更新されました'
    else
    flash[:alert] = 'カート内のギフトの更新に失敗しました'
    redirect_to cart_items_path
    end
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
     if @cart_item.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
     else
      flash[:alert] = '削除に失敗しました'
     end
      redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    if @cart_items.destroy_all
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to cart_items_path
  end







  #def sum_of_price
    #item.price * amount
  #end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :cusotmer_id)
  end



end
