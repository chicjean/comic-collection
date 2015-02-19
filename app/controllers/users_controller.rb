class UsersController < ApplicationController

	before_action :set_user
	before_action :require_signin 
	before_action :require_current_user
	
	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @user, notice: "Your information has been successfully updated!"
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		session[:user_id] = nil

		redirect_to root_path, alert: "Your account has been successfully deleted."
	end

private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def require_current_user 
		unless @user == current_user
			redirect_to series_index_path, alert: "You are not authorized to access that page!"
		end
	end

end
