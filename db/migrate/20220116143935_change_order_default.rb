class ChangeOrderDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :orders, :shipping_cost, to: 800
    change_column_default :orders, :status, to: 0
    change_column_default :order_details, :making_status, to: 0

  end
end
