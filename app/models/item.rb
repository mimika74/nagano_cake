class Item < ApplicationRecord


  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image

  def with_tax_price
    (price * 1.1).floor
  end

  enum is_active: { stopping_sale: false, on_sale: true }
end
