class DashboardController < ApplicationController
	layout 'dashboard'

	def badges
		@badges = @current_user.badges
	end 
end