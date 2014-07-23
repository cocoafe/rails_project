class ChartsController < ApplicationController
authorize_resource :class => false
  def index
  end

  def galaxy
  		@galaxy = Galaxy.new.chart_galaxy
  		@chart_galaxy = chart(@galaxy,'#B404AE','#29088A','column')

end

  def product_family
    @family = Family.new.chart_family
    @chart_family = chart(@family,'#0174DF','#04B431','column')
 end

  def alien_category
    @category = Category.new.chart_category
    @chart_category = chart(@category,'#01A9DB','#DF7401','column')
  end

  def logs
    @log = Log.new.chart_log
    @chart_log = chart(@log,'#01A9DB','#DF7401','spline')
  end
end
