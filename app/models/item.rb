class Item < ApplicationRecord
 has_one_attached :item  
 has_many :cart_items
def with_tax_price
  (price * 1.1).floor
end
def subtotal
  item.with_tax_price * amount
end
end
