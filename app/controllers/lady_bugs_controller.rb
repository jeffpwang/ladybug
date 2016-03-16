class LadyBugsController < ApplicationController

def new
  @ladybug = LadyBug.new
end

def create
  @ladybug = LadyBug.create(ladybug_params)
  redirect_to lady_bug_path(@ladybug)
end 

def edit
  @ladybug = LadyBug.find(params[:id])
end 

def update
  @ladybug = LadyBug.find(params[:id])
  @ladybug.update(ladybug_params)
  @ladybug.save

  redirect_to lady_bug_path(@ladybug)
end 

def index
  @ladybugs = LadyBug.all
end


private

def ladybug_params
  params.require(:lady_bug).permit(:content)
end 

end
