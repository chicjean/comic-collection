require 'rails_helper'

describe "Updating a user" do 

	before do
		@user = User.create!(user_attributes)

		sign_in(@user)	
	end

	it "updates a user and shows the updated user" do 
		visit user_path(@user)

		expect(page).to have_text(@user.name)

		click_link "Edit Profile"

		expect(current_path).to eq(edit_user_path(@user))

		fill_in "Name", with: "Valid Name"

		click_button "Update User"

		expect(current_path).to eq(user_path(@user))
		expect(page).to have_text("Valid Name")
		expect(page).not_to have_text(@user.name)
	end

	it "does not update the user if it's invalid" do 
		visit edit_user_path(@user)

		fill_in "Name", with: ""

		click_button "Update User"

		expect(current_path).to eq(current_path)
		expect(page).to have_text("error")
	end

end