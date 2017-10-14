class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user
  has_many :items, through: :line_items


  def  add_item(item_id)
  #  binding.pry
  line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    
    else
      line_item = self.line_items.new(item_id: item_id)
    end
    line_item
  end

  def total
       self.line_items.collect{ |li| li.item.price * li.quantity }.sum
  end

end
