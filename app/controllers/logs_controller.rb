class LogsController < ApplicationController

	before_action :find_log, only: [:show, :edit, :update, :destroy] 

	def new
		@log = Log.new
		@log.tags.build
	end

	def create
	 @log =  current_user.logs.build(logs_params)
	 @log.tag_new=(params[:log][:tag_new])
	 @log.save 
	 if @log.valid?
	  redirect_to user_path(current_user.id)
	  flash[:notice] = "Success! Log successfully created."
	 else
	  render 'new'
	 end

	end

	def show
		@log = Log.find(params[:id])
	end

	def edit
	end

	def update
		@log.update(logs_params)
		@log.tag_new=(params[:log][:tag_new])
	 	redirect_to user_path(current_user.id)
	 	flash[:notice] = "Success! Log successfully updated."
	end

	def index
		@logs = current_user.logs.paginate(:page => params[:page], :per_page => 5)
	end

	def destroy
		@log.destroy
		redirect_to user_path(current_user.id)		
		flash[:alert] = "Log successfully deleted."
	end

	private

	def find_log
		@log = Log.find(params[:id])
	end

	def logs_params
	 params.require(:log).permit(:tag_new, :content, :before_rating, :after_rating, :belief_id, :distortion_id, :lady_bug_ids => [], :tag_ids => [])
	end

end
