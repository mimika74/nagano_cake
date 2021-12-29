class Public::CartItemsController < ApplicationController

  before_action :setup_cart_item!, only: %i[add_item update_item delete_item]

  def index
    @cart_item = current_cart.cart_item.includes([:item])
    @total = @cart_item.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item ||= current_cart.cart_item.build(item_id: params[:item_id])
    @cart_item.quantity += params[:amount].to_i
    if  @cart_item.save
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
    redirect_to my_cart_path
    end
  end

  def destroy
     if @cart_item.destroy
      flash[:notice] = 'カート内のギフトが削除されました'
     else
      flash[:alert] = '削除に失敗しました'
     redirect_to my_cart_path
     end
  end

  def destroy_all
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

  def setup_cart_item!
    @cart_item = current_cart.cart_item.find_by(item_id: params[:item_id])
  end


end
