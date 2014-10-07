class UsersController < ApplicationController
	layout "pages"
	def new
		redirect_to root_path if @current_user 
		@user = User.new
	end 

	def create
		@user = User.new user_params
		@user.xp = 0
		@user.level = 1
		if @user.save
			redirect_to root_path
		else 
			render :new 
		end 
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end 
end 