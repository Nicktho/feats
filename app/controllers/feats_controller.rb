class FeatsController < ApplicationController 
	layout 'dashboard'

	before_action :check_level, :check_badges

	def index 
		redirect_to root_path unless @current_user
		@uncomplete = @current_user.feats.where(completed: false).order(deadline: :asc)
	end 

	def new
		redirect_to root_path unless @current_user
		@feat = Feat.new
	end 

	def create
		@feat = Feat.new feat_params
		@feat.completed = false
		@feat.user = @current_user
		if @feat.save
			redirect_to feats_path
		else 
			render :new
		end
	end 

	def complete
		@feat = Feat.find params[:id]
		@feat.completed = true
		@feat.save
		redirect_to feats_path
		@current_user.xp += 10
		@current_user.save
	end 

	def show_completed
		@completed_feats = @current_user.feats.where(completed: true)
	end 

	def clear_feats
		completed = @current_user.feats.where(completed:true)
		completed.destroy_all
		redirect_to show_completed_feats_path
	end 

	private
	def feat_params
		params.require(:feat).permit(:description, :deadline)
	end 

	def check_level
		@current_user.update_level 	if logged_in?
	end 

	def check_badges
		all_badges = Badge.all 
		all_badges.each do |b|
			unless @current_user.badges.include? b
				@current_user.badges << b if b.conditions_met?(@current_user) 
			end 
		end 
	end 

end 