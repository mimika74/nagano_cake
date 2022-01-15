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
      flash[:notice] = '追加されました。'
      redirect_to addresses_path
    else
      flash[:alert] = '追加に失敗しました。'
      redirect_to addresses_path
    end
  end

  def edit
     @customer_address = Address.find(params[:id])
     #@address.customer_id = current_customer.id
     #if @customer_address = current_customer.address
       #render "edit"
     #else
       #redirect_to root_path
     #end

  end

  def update
     flash[:notice] ="You have updated  successfully."

    @customer_address = Address.find(params[:id])

    @customer_address.update(address_params)
    if @customer_address.save
    redirect_to addresses_path
    else
    render :edit
    end
  end

  def destroy
    address.customer_id = current_customer.id
    address.destroy
    redirect_to addresses_path
  end

private
  def address_params
  params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end


end
