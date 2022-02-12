class Admin::OrderDetailsController < ApplicationController

  def update

    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    @order_details = @order.order_details



    if @order_details.where(making_status: "in_production").count >= 1
      @order.status = 2
      @order.save


    elsif @order_details.where(making_status: "production_complete").count == @order_details.count
          @order.status = "preparing"
          @order.save

    end

    redirect_to admin_orders_show_path(@order.id)

  end

  private

  def order_detail_params
  params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end

end
