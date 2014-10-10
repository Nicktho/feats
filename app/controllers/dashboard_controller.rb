class DashboardController < ApplicationController
	layout 'dashboard'

	before_action :check_badges, :check_level

	def badges
		@badges = @current_user.badges
		@totalbadges = Badge.all.count
	end 

	def settings
	end

	def check_level
		@current_user.update_level 	if logged_in?
	end 


	def check_badges
		all_badges = Badge.all 
		@badge_msg = []
		all_badges.each do |b|
			unless @current_user.badges.include? b
				@current_user.badges << b and @badge_msg << "Congrats! You got the '#{b.name}' badge!" if b.conditions_met?(@current_user) 
				
			end 
		end 
		@badge_msg
	end 
end