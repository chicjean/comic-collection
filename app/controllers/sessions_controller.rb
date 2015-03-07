class SessionsController < ApplicationController

	def new
	end

	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			redirect_to series_index_path, notice: "Welcome Back!"
		else
			flash.now[:alert] = "Invalid Email/Password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, alert: "You have successfully signed out!"
	end

end