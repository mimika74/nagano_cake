class Public::AddressesController < ApplicationController

  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def address_params
  params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end


end
