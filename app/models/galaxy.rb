class Galaxy < ActiveRecord::Base
	has_many :planet
 
	def chart_galaxy
		galaxy = Galaxy.all
		galaxy_chart = {}
		
		closed = 0
		profit_closed = 0
		galaxy.each do |galaxy|
			galaxy.planet.each do |planet|
				planet.logs.each do |log|
					if log.closed?
						closed += 1
						profit_closed += log.revenue_month
						profit_closed += log.setup_charge if log.setup_charge.present?
					end
					
					
					
				end
			end
			
			galaxy_name = [show_galaxy(galaxy.id)]
			galaxy_closed_to_ar = [closed]
			galaxy_closed_profit = [profit_closed.to_f]

			if galaxy_chart["Profit_Closed"].nil?
				galaxy_chart["Name"] = galaxy_name
			    galaxy_chart["Closed"] = galaxy_closed_to_ar
			    galaxy_chart["Profit_Closed"] = galaxy_closed_profit
		        
		        closed = 0
		        profit_closed = 0
			else
	     galaxy_chart["Name"] += galaxy_name
		 
		 galaxy_chart["Closed"] += galaxy_closed_to_ar
		 galaxy_chart["Profit_Closed"] += galaxy_closed_profit
		
		 closed = 0
		 profit_closed = 0
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
