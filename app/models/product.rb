class Product < ActiveRecord::Base
	belongs_to :family
	has_many :logs
end
