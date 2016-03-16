class PagesController < ApplicationController

	skip_before_filter :authorize
	
  def home
  end

  def about
  end

end
