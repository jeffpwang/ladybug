class LogsController < ApplicationController

def new
 @log = Log.new
 @ladybug = @log.lady_bugs.build
end

def create
 @log = Log.create(logs_params)
 if @log.valid?
  @log.save

  redirect_to @log
 else
  render 'new'
 end
end

def show
  @log = Log.find(params[:id])
end

private

def logs_params
 params.require(:log).permit(:content, :before_rating, :after_rating)
end

end
