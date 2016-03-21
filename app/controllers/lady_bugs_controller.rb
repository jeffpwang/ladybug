class LadyBugsController < ApplicationController

  def new
    @ladybug = LadyBug.new
  end

  def create
    @ladybug = current_user.lady_bugs.build(ladybug_params)
    if @ladybug.save
      redirect_to new_log_path
    else
      render :new
    end
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
    @ladybugs = current_user.ladybugs
  end

  def show
    @ladybug = LadyBug.find(params[:id])
  end

  private

  def ladybug_params
    params.require(:lady_bug).permit(:content)
  end 

end
