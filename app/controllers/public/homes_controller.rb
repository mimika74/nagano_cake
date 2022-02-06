class Public::HomesController < ApplicationController


 def top
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(4)
    @items = Item.where(genre_id: params[:genre_id].to_i) if params[:genre_id].present?
    @search = Item.ransack(params[:q])
    @search_items = @search.result
    #@search_genres = @item.genre
    #@search = Item.where(genre_id: params[:genre_id].to_i) if params[:genre_id].present?
    @search_items = Item.where(genre_id: params[:genre_id].to_i) if params[:genre_id].present?


 end

 def about
 end




end
