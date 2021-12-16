class Item < ApplicationRecord

  belongs_to :admin
  belongs_to :jenre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :image_id

end
