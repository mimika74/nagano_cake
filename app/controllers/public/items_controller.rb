class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = @items
    @search = Item.ransack(params[:q])
    @search_items = @search.result
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def set_search
  @search = Genre.ransack(params[:q])
  @search_items = @search.result
  end


private

def item_params
  params.require(:item).permit(:name, :image_id, :introduction, :price, :genre, :keyword)
end



end
