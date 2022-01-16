class Order < ApplicationRecord

  belongs_to :customer
  belongs_to :cart_item


  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { id0: 0, id1: 1, id2: 2, id3: 3, id4: 4 }

end
