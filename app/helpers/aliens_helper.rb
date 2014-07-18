module AliensHelper
	
	def product_show(id)
		product = Product.find_by_id(id)
		if product.blank?
		else
		product.product_name
	    end
	end
end
