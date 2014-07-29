class Planet < ActiveRecord::Base
	belongs_to :galaxy
	has_many :logs
	validates :planet_name , presence: true
end
