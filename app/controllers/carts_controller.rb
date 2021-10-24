class CartsController < ApplicationController
    def show
      @cart_items = current_cart.cart_items.includes([:product])
      @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
    end
end
