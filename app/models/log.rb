class Log < ActiveRecord::Base
	belongs_to :alien
	belongs_to :product
	belongs_to :planet
	validates :revenue_month, :numericality => {:greater_than_or_equal_to => 0.0}

	def chart_log
		log = Log.all
		month = [1,2,3,4,5]
		data_for_chart = {}
		profit_closed = 0
		closed = 0
		current_month = ""
		current_year = ""
		month.each do |month|
			log.each do |log|

				if log.created_date.month == month

					if log.closed
						closed += 1
						profit_closed += log.revenue_month
						profit_closed += log.setup_charge if log.setup_charge.present?
					end
					current_year = log.created_date.year.to_s
					current_month = log.created_date.month
				end
			end


			log_closed_to_ar = [closed]
			log_name = [show_month(current_month) + " " + current_year]
			log_profit_closed = [profit_closed.to_f]

			if data_for_chart["Profit_Closed"].nil?
				data_for_chart["Name"] = log_name

			    data_for_chart["Closed"] = log_closed_to_ar
			    data_for_chart["Profit_Closed"] = log_profit_closed

		        closed = 0
		        profit_closed = 0
			else

		 		data_for_chart["Name"] += log_name

		 		data_for_chart["Closed"] += log_closed_to_ar
		 		data_for_chart["Profit_Closed"] += log_profit_closed

		 		closed = 0
		 		profit_closed = 0
		    end
		 end
		 return data_for_chart
	end

	def show_month(id)
		case id
		when 1
			"January"
		when 2
			"February"
		when 3
			"March"
		when 4
			"April"
		when 5
			"May"
		end
	end
end
