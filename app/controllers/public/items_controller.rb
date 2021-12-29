class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = @items
  end

  def show
    @item = Item.find(params[:id])

  end


private

def item_params
  params.require(:item).permit(:name, :image_id, :introduction, :price, :genre)
end



end
