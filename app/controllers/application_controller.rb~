class ApplicationController < ActionController::Base
  
  before_filter :authorize
  protect_from_forgery

  #only available to controllers
  private
	
	def current_cart
	  Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
	  cart = Cart.create
	  session[:cart_id] = cart.id
	  #return new cart
	  cart
	end

	def increment_counter
  	  if session[:counter].nil?
	    session[:counter] = 0
       	  end
	  
          session[:counter] += 1
	end

  protected
  	def authorize
	  unless User.find_by_id(session[:user_id])
	    redirect_to login_url, notice: "Please log in"
	  end
	end

end
