class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy

  attr_accessible :address, :email, :name, :pay_type

  PAYMENT_TYPES = ["Check", "Credit card", "Purchase order"]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  #called from orders_controller
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil #prevents deletion of item when cart is destroyed
      line_items << item
    end
  end

end
