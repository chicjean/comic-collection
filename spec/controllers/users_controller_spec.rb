require 'rails_helper'

describe UsersController do

	let(:user) { User.create!(user_attributes) }

	context "when not signed in " do 

		before do
      session[:user_id] = nil
    end

		it "cannot access show" do
      get :show, id: user

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

		it "cannot destroy the user" do 
			delete :destroy, id: user

			expect(response).to redirect_to(signin_path)
		end

	end

	context "when signed in as the wrong user" do 

		let(:wrong_user) { User.create!(user_attributes(email: "wrong@example.com")) }

		before do
      session[:user_id] = wrong_user.id
    end

		it "cannot access edit for another user" do 
			get :edit, id: user

			expect(response).to redirect_to(series_index_url)
		end

		it "cannot access update for another user" do 
			patch :update, id: user

			expect(response).to redirect_to(series_index_url)
		end

		it "cannot destroy another user" do 
			delete :destroy, id: user

			expect(response).to redirect_to(series_index_url)
		end

	end

	context "when not signed in as an admin user" do 

		it "cannot access new" do 
			get :new

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access create" do 
			get :create

			expect(response).to redirect_to(signin_path)
		end

	end
 
end
