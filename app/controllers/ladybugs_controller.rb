class LadybugsController < ApplicationController

def new
  @ladybug = Ladybug.new
end

def create
  @ladybug = Ladybug.create(ladybug_params)
  redirect_to ladybug_path(@ladybug)
end 

def edit
  @ladybug = Ladybug.find(params[:id])
end 

def update
  @ladybug = Ladybug.find(params[:id])
  @ladybug.update(ladybug_params)
  @ladybug.save

  redirect_to ladybug_path(@ladybug)
end 


private

def ladybug_params
  params.require(:ladybug).permit(:content)
end 

end
