class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize

  private  
    def current_cart  
      Cart.find(session[:cart_id])  
    rescue ActiveRecord::RecordNotFound  
 	  # 如果找不到，创建新的cart,然后返回新创建的cart
 	  cart=Cart.create  
 	  session[:cart_id]=cart.id  
	  cart  
 	end

  protected
 
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end



end
