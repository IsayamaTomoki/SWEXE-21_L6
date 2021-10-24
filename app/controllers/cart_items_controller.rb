class CartItemsController < ApplicationController
    before_action :setup_cart_item!, only: %i[create destroy]
    def new
      @cart_item = CartItem.new
      @product = Product.find(params[:id])
    end
    def create
      @cart_item ||= current_cart.cart_items.build(product_id: params[:cart_item][:product_id])
      @cart_item.qty = params[:cart_item][:qty].to_i
      if  @cart_item.save
        flash[:notice] = '商品が追加されました。'
        redirect_to '/carts/show'
      else
        redirect_to new_cart_item_path(id: params[:cart_item][:product_id])
      end
    end
    def destroy
      if @cart_item.destroy
        flash[:notice] = 'カート内のギフトが削除されました'
      else
        flash[:alert] = '削除に失敗しました'
      end
      redirect_to '/carts/show'
    end
    
    private
    def setup_cart_item!
      @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])
    end
end
