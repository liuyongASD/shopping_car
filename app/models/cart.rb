class Cart < ActiveRecord::Base
	# has_many :line_items一个购物车有许多相关联的在线商品。
    # :dependent => :destroy在线商品的存在依赖于购物车是否存在
	has_many :line_items, :dependent => :destroy

	def add_product(product_id)  
    current_item = line_items.find_by_product_id(product_id)  
    if current_item  
      current_item.quantity += 1  
    else  
      current_item = line_items.build(:product_id => product_id)  
    end  
    current_item  
  end

  def total_price  
      line_items.to_a.sum { |item| item.total_price }  
  end

  def total_items
     line_items.sum(:quantity)
   end 
    
end
