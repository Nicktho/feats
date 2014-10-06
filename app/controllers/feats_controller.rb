class FeatsController < ApplicationController 
	layout 'dashboard'
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
	end 

	private
	def feat_params
		params.require(:feat).permit(:description, :deadline)
	end 

end 