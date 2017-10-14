class Item < ActiveRecord::Base

  belongs_to :category
  has_many :line_items
  has_many :carts, through: :line_items

  def self.available_items
    availableItems = []
    Item.all.each do |item|
      if item.inventory > 0
      availableItems << item
      end
    end
    availableItems
    end

end
