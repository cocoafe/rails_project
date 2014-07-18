module ViewHelper
	def product_show(id)

		product = Product.find_by_id(id)

		unless product.blank?
		product.product_name
	    end
	end

	def planet_show(id)

		planet = Planet.find_by_id(id)
		
		unless planet.blank?
		planet.planet_name
	    end
	end

	def alien_show(id)

		alien = Alien.find_by_id(id)
		
		unless alien.blank?
		alien.alien_name
	    end
	end

	def category_show(id)
		category = Category.find_by_id(id)
		
		unless category.blank?
		category.alien_category
	    end
	end

	def family_show(id)
		family = Family.find_by_id(id)
		
		unless family.blank?
		family.product_family
	    end
	end

	def galaxy_show(id)

		galaxy = Galaxy.find_by_id(id)

		unless galaxy.blank?
			galaxy.galaxy_name
		end

	end

	def closed_show(bool)
		if bool
			"Yes"
		else
			"No"
		end
	end	


end