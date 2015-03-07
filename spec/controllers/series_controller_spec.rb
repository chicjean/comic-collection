require 'rails_helper'

describe SeriesController do

	let(:user) { User.create!(user_attributes) }

	before do
		sign_in(user)
	end	

	context "when not signed in as an authorized user" do 

		before do 
			session[:user_id] = nil
		end

		it "cannot access index" do
      get :index

      expect(response).to redirect_to(signin_path)
    end

		it "cannot access show" do 
			get :show, id: user

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access new" do
			get :new, id: user

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access create" do
			post :create, id: user

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access edit" do 
			get :edit, id: user

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access update" do 
			patch :update, id: user

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access destroy" do 
			delete :destroy, id: user

			expect(response).to redirect_to(signin_path)
		end
		
	end

end