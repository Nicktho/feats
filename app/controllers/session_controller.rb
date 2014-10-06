class SessionController < ApplicationController
	layout "pages"

	# login 
	def new 
		redirect_to root_path if @current_user
	end 

	# Where the data gets POSTed
	def create
		user = User.where(:username => params[:username]).first 
		if user.present? && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to feats_path
		else
			@error = "Login Incorrect"
			render :new
		end
	end 

	# Logout
	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end 

end 