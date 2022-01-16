class ChangeOrderDefault2 < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :status, :integer, default: 0
    change_column :orders, :shipping_cost, :integer, default: 800
    change_column :order_details, :making_status, :integer, default: 0

  end
end
