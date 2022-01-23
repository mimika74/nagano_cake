class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    @customer_address = current_customer
    if @customer == current_customer
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
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, alert: "ご利用誠にありがとうございました。"
    #redirect_to customers_withdraw_path, alert: "ご利用誠にありがとうございました。"
  end




private

def customer_params
  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted, :created_at, :updated_at)
end


end
