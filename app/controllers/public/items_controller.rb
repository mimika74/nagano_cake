class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = @items
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


private

def item_params
  params.require(:item).permit(:name, :image_id, :introduction, :price, :genre)
end

de

end
