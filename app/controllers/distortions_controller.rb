class DistortionsController < ApplicationController

def new
 @distortion = Log.new
end

def create
 @distortion = Distortion.create(distortions_params)
 if @distortion.valid?
  @distortion.save

  redirect_to @distortion
 else
  render 'new'
 end
end

def index
  @distortions = Distortion.all
end

def show
  @distortion = Distortion.find(params[:id])
end

private

def distortions_params
 params.require(:distortion).permit(:name)
end

end
