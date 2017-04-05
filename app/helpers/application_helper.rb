module ApplicationHelper
	#  帮助方法hidden_div_if：
    #     它接受一个条件，一个可选的属性集合和一个快。它将块的输出整合在<div>
    #     标签中，如果条件为真，就在该标签中增加display:none风格。
    #        
	def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

end
