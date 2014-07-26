require 'smarter_csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	

admin = User.create(:username => "admin" , :password => "12345678" , :password_confirmation => "12345678", :role => "admin")
reporter = User.create(:username => "reporter" , :password => "12345678" , :password_confirmation => "12345678", :role => "reporter")



alien = SmarterCSV.process('csv/aliens.csv')
product = SmarterCSV.process('csv/products.csv', :key_mapping => {:product => :product_name})
planet = SmarterCSV.process('csv/planets.csv', :key_mapping => {:planet => :planet_name , :galaxy => :galaxy_name })
data = SmarterCSV.process('csv/data.csv', :key_mapping => {:planet => :planet_name , :galaxy => :galaxy_name , :product => :product_name })



 alien.each do |f|

 category = Category.find_or_create_by(:alien_category => f[:alien_category])
 alien = Alien.find_by(:alien_name => f[:alien_name])
	unless alien.present?
		x = Alien.new(:alien_name => f[:alien_name], :category_id => category.id)
		x.save!
    end
end



product.each do |f|
	
family = Family.find_or_create_by(:product_family => f[:product_family])
product = Product.find_by(:product_name => f[:product_name])
unless product.present?
	x = Product.new(:product_name => f[:product_name], :family_id => family.id)
	x.save!
end
end

	

planet.each do |f|	

galaxy = Galaxy.find_or_create_by(:galaxy_name => f[:galaxy_name])
planet = Planet.find_by(:planet_name => f[:planet_name])
unless planet.present?
  x = Planet.new(:planet_name => f[:planet_name] , :galaxy_id => galaxy.id)
  x.save!
 end
end

 data.each do |f|
    
  alien = Alien.find_by(:alien_name => f[:alien_name])
  product = Product.find_by(:product_name => f[:product_name])
  planet = Planet.find_by(:planet_name => f[:planet_name])

  if f[:closed] == "Yes"
  	closed = true
  else
  	closed = false
  end
 if alien.present? and product.present? and planet.present?
  x = Log.new(:alien_id => alien.id , :product_id => product.id , :planet_id => planet.id , 
              :stage => f[:stage] , :created_date => f[:created_date], :close_date => f[:close_date],
              :closed => closed,
              :setup_charge => f[:setup_charge], :revenue_month => f[:revenue_month])
              
  x.save!
 else
  x = Log.new(:stage => "Error")
  x.save!
end
end