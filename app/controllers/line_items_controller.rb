class LineItemsController < ApplicationController


  def create
  #current_user(gives a logeed in user) is a default method provided by devise
  #current_cart is defined in User class as a variable which belongs to a class cart and user user_id as a foreign key


       #binding.pry
      if !current_user.current_cart
        current_user.current_cart = current_user.carts.create
      end
        current_user.current_cart.add_item(params[:item_id]).save # add_item is a method defined in the Cart class
        current_user.save
        redirect_to cart_path(current_user.current_cart)
  end
end
