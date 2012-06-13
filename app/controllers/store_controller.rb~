
class StoreController < ApplicationController
  def index
	@products = Product.order(:title)
	increment_counter

        @cart = current_cart
  end
end
