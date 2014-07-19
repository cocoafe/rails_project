module ViewHelper
	def show_product(id)

		product = Product.find_by_id(id)

		unless product.blank?
		product.product_name
	    end
	end

	def show_planet(id)

		planet = Planet.find_by_id(id)
		
		unless planet.blank?
		planet.planet_name
	    end
	end

	def show_alien(id)

		alien = Alien.find_by_id(id)
		
		unless alien.blank?
		alien.alien_name
	    end
	end

	def show_category(id)
		category = Category.find_by_id(id)
		
		unless category.blank?
		category.alien_category
	    end
	end

	def show_family(id)
		family = Family.find_by_id(id)
		
		unless family.blank?
		family.product_family
	    end
	end

	def show_galaxy(id)

		galaxy = Galaxy.find_by_id(id)

		unless galaxy.blank?
			galaxy.galaxy_name
		end

	end

	def show_closed(bool)
		if bool
			"Yes"
		else
			"No"
		end
	end	


end