class Galaxy < ActiveRecord::Base
	has_many :planet
 
	def chart_galaxy
		galaxy = Galaxy.all
		galaxy_chart = {}
		galaxy_chart["Profit"] = nil
		galaxy_chart["Closed"] = nil
		galaxy_chart["Name"] = nil
		profit = 0.0
		closed = 0
		galaxy.each do |galaxy|
			galaxy.planet.each do |planet|
				planet.logs.each do |log|
					if log.closed?
						closed += 1
					end

					if log.setup_charge.nil?
					profit += log.revenue_month
					else
					profit += log.revenue_month + log.setup_charge
					end
				end
			end
			galaxy_name = [show_galaxy(galaxy.id)]
			galaxy_to_ar = [profit.to_f]
			galaxy_closed_to_ar = [closed]

			if galaxy_chart["Profit"].nil?
				galaxy_chart["Name"] = galaxy_name
				galaxy_chart["Profit"] = galaxy_to_ar
			    galaxy_chart["Closed"] = galaxy_closed_to_ar
		        profit = 0
		        closed = 0
			else
	     galaxy_chart["Name"] += galaxy_name
		 galaxy_chart["Profit"] += galaxy_to_ar
		 galaxy_chart["Closed"] += galaxy_closed_to_ar
		 profit = 0
		 closed = 0
		   end
		end
		galaxy_chart
	end

			def show_galaxy(id)

		galaxy = Galaxy.find_by_id(id)

		unless galaxy.blank?
			galaxy.galaxy_name
		end

	end


end
