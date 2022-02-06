class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
    @items = Item.where(genre_id: params[:genre_id].to_i) if params[:genre_id].present?
    @search = Item.ransack(params[:q])
    @search_items = @search.result
    #@search_genres = @item.genre
    #@search = Item.where(genre_id: params[:genre_id].to_i) if params[:genre_id].present?
    @search_items = Item.where(genre_id: params[:genre_id].to_i) if params[:genre_id].present?


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
