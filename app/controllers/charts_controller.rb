class ChartsController < ApplicationController
  def index
  end

  def galaxy
  		@galaxy = Galaxy.new.chart_galaxy
  		@chart_galaxy = chart(@galaxy,'#B404AE','#29088A')

end

  def product_family
    @family = Family.new.chart_family
    @chart_family = chart(@family,'#0174DF','#04B431')
 end

  def alien_category
    @category = Category.new.chart_category
    @chart_category = chart(@category,'#01A9DB','#DF7401')
  end
end
