class BadgesController < ApplicationController
	before_action :check_if_admin
	layout 'admin'

	def new
	end

	def check_if_admin
		redirect_to root_path unless is_admin?
	end 
end 