class HomeController < ApplicationController
	
  def index
  	redirect_to charts_index_path if current_user.role == "reporter"
  end
end
