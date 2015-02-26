require 'spec_helper'

describe "Viewing a user's profile page" do

	before do 
		@user = User.create!(user_attributes)

		sign_in(@user)

		visit user_path(@user)
	end

it "shows the user's name and email" do 
	expect(page).to have_text(@user.name)
	expect(page).to have_text(@user.email)

	expect(page).not_to have_text(@user.password)
end

end