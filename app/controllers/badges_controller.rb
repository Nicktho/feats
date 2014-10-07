class BadgesController < ApplicationController
	before_action :check_if_admin
	layout 'admin'

	def index
		@badges = Badge.all
	end 

	def new
		@badge = Badge.new
		@user_vars = User.column_names
		@operators = [
			"=",
			">",
			"<",
		]
	end

	def create
		@badge = Badge.new badges_params
		if @badge.save 
			redirect_to badges_path
		else
			render :new 
		end
	end 

	def destroy
		@badge = Badge.find params[:id]
		@badge.destroy 
		redirect_to badges_path
	end 


	private 
	def check_if_admin
		redirect_to root_path unless is_admin?
	end 

	def badges_params
		params.require(:badge).permit(:name, :description, :image, :condition_variable, :condition_operator, :condition_value)
	end 

end 