class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Acces Denied!"
    redirect_to root_url
  end
  
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me, :role) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password , :role) }
  end

  def chart(model_data,color1,color2,type)
    @chart_galaxy = LazyHighCharts::HighChart.new('graph') do |f|
        f.title(:text => "Profits and Closed Sales")
        f.xAxis(:categories => model_data["Name"])
        f.series(:name => "Profit Closed ", :yAxis => 0, :data => model_data["Profit_Closed"] ,:color => color2)
        f.series(:name => "Closed Sales", :yAxis => 1, :data => model_data["Closed"], :color => color1)
        

        f.yAxis [
          {:title => {:text => "Profit Closed", :margin => 50} },
          {:title => {:text => "Closed Sales"}, :opposite => true},
         
        ]
        f.plot_options(:column => { :minPointLength => 9 } )
        f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        f.chart({:defaultSeriesType=> type })
      end
  end

end
