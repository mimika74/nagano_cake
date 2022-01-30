class Admin::CustomersController < ApplicationController
  def index

    @customers =Customer.all

  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    @customer.update(customer_params)
    if @customer.save
    redirect_to admin_customers_show_path(@customer.id)
    else
    render :edit
    end
  end


  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :encryptes_password, :postal_code, :address, :telephone_number, :is_deleted, :created_at)

  end

end
