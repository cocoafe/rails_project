class Family < ActiveRecord::Base
	has_many :products

	def chart_family
		family = Family.all
		family_chart = {}
		family_chart["Profit"] = nil
		family_chart["Closed"] = nil
		profit = 0.0
		closed = 0
		family.each do |family|
			family.products.each do |product|
				product.logs.each do |log|
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

			family_to_ar = [profit.to_f]
			family_closed_to_ar = [closed]
			family_name = [show_family(family.id)]
			if family_chart["Profit"].nil?
				family_chart["Name"] = family_name
				family_chart["Profit"] = family_to_ar
			    family_chart["Closed"] = family_closed_to_ar
		        profit = 0
		        closed = 0
			else

		 family_chart["Name"] += family_name
		 family_chart["Profit"] += family_to_ar
		 family_chart["Closed"] += family_closed_to_ar
		 profit = 0
		 closed = 0

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
