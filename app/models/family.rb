class Family < ActiveRecord::Base
	has_many :products

	def chart_family
		family = Family.all
		family_chart = {}
		
		closed = 0
		profit_closed = 0
		family.each do |family|
			family.products.each do |product|
				product.logs.each do |log|
					if log.closed?
						closed += 1
						profit_closed += log.revenue_month
						profit_closed += log.setup_charge if log.setup_charge.present?
					end
		           
				end
			end

			
			family_closed_to_ar = [closed]
			family_name = [show_family(family.id)]
			family_closed_profit = [profit_closed.to_f]

			if family_chart["Profit_Closed"].nil?
				family_chart["Name"] = family_name
				
			    family_chart["Closed"] = family_closed_to_ar
			    family_chart["Profit_Closed"] = family_closed_profit
		        
		        profit = 0
		     
		        profit_closed = 0
			else

		 family_chart["Name"] += family_name
		
		 family_chart["Closed"] += family_closed_to_ar
		 family_chart["Profit_Closed"] += family_closed_profit
	
		 closed = 0
		 profit_closed = 0

		   end
		end
		family_chart
	end

	def show_family(id)

		family = Family.find_by_id(id)

		unless family.blank?
			family.product_family
		end

	end
end
