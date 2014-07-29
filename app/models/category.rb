class Category < ActiveRecord::Base
	has_many :alien
	validates :alien_category , presence: true , length: 3..20

	def chart_category
		category = Category.all
		category_chart = {}

		closed = 0
		profit_closed = 0

		category.each do |category|
			category.alien.each do |alien|
				alien.logs.each do |log|
					if log.closed?
						closed += 1
					    profit_closed += log.revenue_month
						profit_closed += log.setup_charge if log.setup_charge.present?
					end

				end
			end


			category_closed_to_ar = [closed]
			category_name = [show_category(category.id)]
			category_closed_profit = [profit_closed.to_f]

			if category_chart["Profit_Closed"].nil?
				category_chart["Name"] = category_name

			    category_chart["Closed"] = category_closed_to_ar
			    category_chart["Profit_Closed"] = category_closed_profit

		        closed = 0
		        profit_closed = 0
			else

		 category_chart["Name"] += category_name

		 category_chart["Closed"] += category_closed_to_ar
		 category_chart["Profit_Closed"] += category_closed_profit

		 closed = 0
		 profit_closed = 0

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
