class Alien < ActiveRecord::Base
	belongs_to :category
	has_many :logs
	validates :alien_name , presence: true , length: 3..40

end
