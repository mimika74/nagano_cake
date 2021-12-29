class Public::CartItemsController < ApplicationController



  def index
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_items ||= current_customer.cart_items.build(item_id: params[:item_id])
    #@cart_items.amount += params[:amount].to_i
    if  @cart_items.save
      flash[:notice] = '商品が追加されました。'
      redirect_to items_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to items_path
    end
  end

  def update
    if @cart_items.update(amount: params[:amount].to_i)
      flash[:notice] = 'カート内のギフトが更新されました'
    else
    flash[:alert] = 'カート内のギフトの更新に失敗しました'
    redirect_to cart_items_path
    end
  end

  def destroy
     if @cart_items.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
     else
      flash[:alert] = '削除に失敗しました'
     end
      redirect_to cart_items_path
  end

  def destroy_all
    if @cart_items.destroy_all
      flash[:notice] = 'カート内のギフトが削除されました'
    else
      flash[:alert] = '削除に失敗しました'
    end
    redirect_to cart_items_path
  end

  def subtotal
    item.with_tax_price * amount
  end

  def total
  end

  def with_tax_price
    (price * 1.1).floor
  end

  def sum_of_price
    item.price * amount
  end

  private

  def cart_item_params
    params.require(:cart_items).permit(:item_id, :amount)
  end



end
