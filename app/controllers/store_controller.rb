class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
  	# 得到销售产品清单
  	@products = Product.all
  	@cart=current_cart
  end
end
