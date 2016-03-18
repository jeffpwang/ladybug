class UsersController < ApplicationController

	skip_before_filter :authorize

	def new
	if current_user
		redirect_to user_path(current_user.id)
	else
	  @user = User.new
	 end
	end

	def create
		@user = User.create(user_params)
	#	binding.pry
		 if @user.save
		 	session[:user_id] = @user.id
			redirect_to @user
		 else
 		 	render 'new'
		 end
	end

	def show
		@user = User.find(params[:id])
		@logs = Log.paginate(:per_page => 2, :page => params[:page])
	end

	def delete
		@user = User.find(current_user[:id])
		@user.destroy
		@user.cleanup
		# redirect_to 
	end

	# def edit
	# 	@user = User.find(params[:id])
	# end

	# def update
	# end


	private

	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation)
	end

end
