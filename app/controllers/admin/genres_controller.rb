class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(item_params)
    @genre.save
    redirect_to "admin/items"
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.update(item_params)
    if @genre.save
    redirect_to "admin/items"
    else
    render :edit
    end
  end
end
