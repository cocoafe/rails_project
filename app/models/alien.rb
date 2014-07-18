class Alien < ActiveRecord::Base
	belongs_to :category
	has_many :logs
	
end
