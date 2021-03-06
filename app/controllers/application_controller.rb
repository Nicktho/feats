class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :is_admin?
  before_action :current_user

	def current_user
  	@current_user = User.find_by(:id => session[:user_id])
		session[:user_id] = nil unless @current_user.present?
		@current_user
  end

  def logged_in?
  	current_user != nil
	end 

  def is_admin? 
    current_user.admin if logged_in?
  end 

end


