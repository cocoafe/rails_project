class Product < ActiveRecord::Base
	belongs_to :family
	has_many :logs
	validates :product_name , presence: true
end
