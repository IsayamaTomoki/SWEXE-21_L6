class Product < ApplicationRecord
   
   has_one :cart_item
   has_one :cart_item_cart, through: :cart_item, source: :cart
   
   def cart_in(qty,cart)
      cart_item.create(qty: qty, cart_id: cart.id)
   end

   def cart_out(cart)
      cart_item.find_by(cart_id: cart.id).destroy
   end

   def cart_in?(cart)
      cart_item_cart.include?(cart)
   end
   
end