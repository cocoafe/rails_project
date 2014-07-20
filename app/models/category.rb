class Category < ActiveRecord::Base
	has_many :alien
	
	def chart_category
		category = Category.all
		category_chart = {}
		profit = 0.0
		closed = 0
		category.each do |category|
			category.alien.each do |alien|
				alien.logs.each do |log|
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

			category_to_ar = [profit.to_f]
			category_closed_to_ar = [closed]
			category_name = [show_category(category.id)]
			if category_chart["Profit"].nil?
				category_chart["Name"] = category_name
				category_chart["Profit"] = category_to_ar
			    category_chart["Closed"] = category_closed_to_ar
		        profit = 0
		        closed = 0
			else

		 category_chart["Name"] += category_name
		 category_chart["Profit"] += category_to_ar
		 category_chart["Closed"] += category_closed_to_ar
		 profit = 0
		 closed = 0

		   end
		end
		category_chart
	end

	def show_category(id)

		category = Category.find_by_id(id)

		unless category.blank?
			category.alien_category
		end

	end
end


