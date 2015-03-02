require 'spec_helper'

describe ComicsController do

	before do 
		@series = Series.create!(series_attributes)
	end

	context "when not signed in as an authorized user" do 

		before do 
			session[:user_id] = nil
		end

		it "cannot accesst new" do
			get :new, series_id: @series

			expect(response).to redirect_to(signin_path)
		end
	
		it "cannot access create" do 
			post :create, series_id: @series

			expect(response).to redirect_to(signin_path)
		end

		it "cannot access delete" do 
			delete :destroy, id: 1, series_id: @series

			expect(response).to redirect_to(signin_path)
		end

	end

end