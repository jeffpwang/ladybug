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
		 if @user.save
		 	session[:user_id] = @user.id
			redirect_to @user
		 else
 		 	render 'new'
		 end
	end

	def show
		@user = User.find(params[:id])
		@logs = @user.logs.order('created_at DESC').first(3)
	end

	def destroy
		@user = User.find(current_user[:id])
		@user.destroy
		session[:user_id] = nil		
		redirect_to root_path
	end


	private

	def user_params
		params.require(:user).permit(:email, :name, :password, :password_confirmation)
	end

end
