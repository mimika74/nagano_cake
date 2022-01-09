class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer == current_user
      render "edit"
    else
      redirect_to "/"
    end
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)

    redirect_to customers_path(@customer.id)
    else
    render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end


private

def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
end


end
