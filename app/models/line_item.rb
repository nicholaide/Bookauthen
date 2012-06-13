class LineItem < ActiveRecord::Base
  #attr is added by Rails, not in book, if commented out, functional tests on book fails
  attr_accessible :cart_id, :product_id, :quantity, :order_id

  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
   product.price * quantity
  end


  
end
