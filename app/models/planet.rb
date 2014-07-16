class Planet < ActiveRecord::Base
	belongs_to :galaxy
	has_many :logs
end
