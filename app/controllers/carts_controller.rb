class CartsController < ApplicationController
   before_action :currentcart

  def checkout
    #if user_signed_in? #Device method user_signed_in
      @cart.status= "submitted"
      @cart.line_items.each do |i|
        item = Item.find_by(id: i.item_id)
        item.update(inventory: item.inventory - i.quantity)
      end

      if @cart.save
        flash[:notice] = "Checkout Successful"
            else
        flash[:notice] = "Unable to Checkout"
      end

   current_user.current_cart = nil
   current_user.save
   redirect_to cart_path(@cart)
  end

  def show
       @cart = Cart.find(params[:id])
  end

  def currentcart
    @cart = Cart.find_by(user_id: current_user.id)
    end

end
