module LogsHelper
	def product_show(id)
		product = Product.find_by_id(id)
		if product.blank?
		else
		product.product_name
	    end
	end
	def alien_show(id)
		alien = Alien.find_by_id(id)
		if alien.blank?
		else
		alien.alien_name
	    end
	end
end
