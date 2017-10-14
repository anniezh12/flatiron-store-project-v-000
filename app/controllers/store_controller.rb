class StoreController < ApplicationController

  def index
    @catergories = Category.all
    @items = Item.available_items
  end

end
