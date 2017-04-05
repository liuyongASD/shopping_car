class LineItem < ActiveRecord::Base
	# belongs_to告诉Rails数据库，
	# 表line_items中的数据是依赖于表carts和表products的
	belongs_to :order
	belongs_to :product
	belongs_to :cart

	def total_price  
  		product.price * quantity  
	end

end
