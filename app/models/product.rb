class Product < ApplicationRecord
   
   has_one :cart_item
   has_one :cart_item_cart, through: :cart_item, source: :cart
end