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
		@user.admin = false
		@user.theme_option = "blue"
		if @user.save
			redirect_to root_path
		else 
			render :new 
		end 
	end

	def edit
		redirect_to feats_path and return unless @current_user.id.to_s == params[:id] 
		@themes = [] 
		@themes << "blue"
		@themes << "gold" if @current_user.level > 1
		@themes << "red" if @current_user.badges.count > 2
		render :layout => "dashboard"

	end 

	def update
		@current_user.update user_params
		redirect_to edit_user_path
	end 

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation, :theme_option, :image)
	end 
end 