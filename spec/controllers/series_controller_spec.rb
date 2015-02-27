require 'spec_helper'

describe SeriesController do

	before do
		@user = User.create!(user_attributes)
		sign_in(@user)
	end	

	context "when not signed in as an authorized user" do 

		before do 
			session[:user_id] = nil
		end

		it "cannot access index" do
      get :index

      expect(response).to redirect_to(root_url)
    end

		it "cannot access show" do 
			get :show, id: @user

			expect(response).to redirect_to(root_url)
		end

		it "cannot access new" do
			get :new, id: @user

			expect(response).to redirect_to(root_url)
		end

		it "cannot access create" do
			post :create, id: @user

			expect(response).to redirect_to(root_url)
		end

		it "cannot access edit" do 
			get :edit, id: @user

			expect(response).to redirect_to(root_url)
		end

		it "cannot access update" do 
			patch :update, id: @user

			expect(response).to redirect_to(root_url)
		end

		it "cannot access destroy" do 
			delete :destroy, id: @user

			expect(response).to redirect_to(root_url)
		end

		it "cannot view an indivial series' redeemed comics" 

		it "cannot view an individual series' undredeemed comics"

	end

end