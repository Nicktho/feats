class DashboardController < ApplicationController
	layout 'dashboard'

	def badges
		@badges = @current_user.badges
		@totalbadges = Badge.all.count
	end 
end