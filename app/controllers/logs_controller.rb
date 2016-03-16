class LogsController < ApplicationController

def new

 @log = Log.new

end

def create
 binding.pry

 @log =  current_user.logs.build(logs_params)
 if @log.valid?
  @log.save
  redirect_to user_path(current_user.id)
 else
  render 'new'
 end
end

def show
  @log = Log.find(params[:id])
end

private

def logs_params
 params.require(:log).permit(:content, :before_rating, :after_rating, :belief_id, :distortion_id, :lady_bug_ids => [], :tag_ids => [])
end

end
