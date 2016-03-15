class LogsController < ApplicationController

def new
  @log = Log.new
end

def create
  @log = Log.new(logs_params)
  if @log.valid?
   @log.save
  else
   render 'new'
  end
end

private

def logs_params
  params.require(:log).permit(:content, :before_rating, :after_rating)
end

end
