class Log < ActiveRecord::Base
	belongs_to :alien	

	def chart
		revenue = Log.order('revenue_month DESC')
		revenue_hash = {:name => [],:revenue => []} 
		i = 0
		revenue.each do |f|
			revenue_hash[:name] << f.id
			revenue_hash[:revenue] << (f.revenue_month.to_f)
			i += 1
			if i > 5
				break
			end
		end
		revenue_hash
	end
	
end
