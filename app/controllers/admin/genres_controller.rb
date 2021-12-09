class Admin::GenresController < ApplicationController
  def index
    @jenre = Jenre.all
    @jenre = Jenre.new
  end

  def edit
    @jenre = Jenre.find(params[:id])
  end

  def create
    @jenre = Jenre.new(item_params)
    @jenre.save
    redirect_to "admin/items"
  end

  def update
    @item = Item.find(params[:id])

    @item.update(item_params)
    if @item.save
    redirect_to "admin/items"
    else
    render :edit
    end
  end
end
