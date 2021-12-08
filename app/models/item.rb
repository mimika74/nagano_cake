class Item < ApplicationRecord

  belongs_to :jenre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image

end
