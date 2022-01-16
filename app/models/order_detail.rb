class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { id0: 0, id1: 1, id2: 2, id3: 3 }

end
