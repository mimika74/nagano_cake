class Admin::ItemsController < ApplicationController
  def index
    @item = Item.all

  end

  def new
    @item = Item.new

  end

  def create

    @item = Item.new(item_params)
    @item.save
    redirect_to "/"
  end


  def show
    @item = Item.find(params[:id])

  end

  def edit
    @item = Item.find(params[:id])

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

private

def item_params
  params.require(:item).permit(:name, :image_id, :introduction)
end


end
