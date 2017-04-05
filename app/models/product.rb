class Product < ActiveRecord::Base 
	# 用字母的顺序来显示商品，default_scope方法，默认范围函数scope
	#会作用与该模型的所有查询
	default_scope {order (:title)}
	has_many :line_items
	has_many :orders, :through => :line_items
	# ensure_not_referenced_by_any_line_itme。
    #hook方法就是在对象的生命周期中某个给定的地方Rails会自动调用的方法。
	before_destroy :ensure_not_referenced_by_any_line_item 

	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
	validates :title, :uniqueness => true
	validates :image_url, :format => {
		:with => %r{\.(gif|jpg|png)$}i, multiline: true,
		:message => 'must be a URL for GIF,JPG or PNG image. '
	}

	private  
	  def ensure_not_referenced_by_any_line_itme  
	   if line_items.empty?  
	    return true  
	   else  
	    errors.add(:base,'Line Items present')  
	    return false  
	  end  
	 end  
	  
end  