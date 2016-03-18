class TagsController < ApplicationController

	def show
		@tag = Tag.find(params[:id])
		@logs = @tag.find_logs_for_tag(current_user.id)
	end
end
