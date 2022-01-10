class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!

  def index
    @customer_address = current_customer.address
    #@address1 = Address.order(updated_at: :desc).limit(1)
    @addresses = Address.all
    @address = Address.new()
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id

    if  @address.save!
      flash[:notice] = '商品が追加されました。'
      redirect_to addresses_path
    else
      flash[:alert] = '商品の追加に失敗しました。'
      redirect_to addresses_path
    end
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
