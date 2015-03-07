require 'rails_helper'

describe "Deleting a user" do 

	let(:user) { User.create!(user_attributes) }

	before do
		sign_in(user)
	end

	 it "destroys the user and redirects to the main page" do 
	 	visit user_path(user)

	 	click_link "Delete Profile"

	 	expect(current_path).to eq(signin_path)
	 	expect(page).to have_text("Your account has been successfully deleted")
	 end

	 it "automatically signs out the user" do 
	 	visit user_path(user)

	 	click_link "Delete Profile"

	 	expect(current_path).to eq(signin_path)
		expect(page).not_to have_link("Sign Out")
	 end

end