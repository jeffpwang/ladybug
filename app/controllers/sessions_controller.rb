class SessionsController <  ApplicationController

   skip_before_filter :authorize

	def new
	end

	def create
		@user = User.find_by_name(params[:name])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to @user
		else
			render 'new'
			flash.alert = "You username or password is invalid"

		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end