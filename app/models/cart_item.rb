class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_one :order, dependent: :destroy

end
