require 'spec_helper'

describe "Creating a user" do 

	before do 
		admin_user = User.new(user_attributes(admin: true))
		sign_in(admin_user)
	end

	it "creates a new user and redirects to the user's show page" do 
		visit new_user_path

		fill_in "Name", with: "User Name"
		fill_in "Email", with: "user@example.com"
		fill_in "Password", with: "password"
		fill_in "Confirm Password", with: "password"

		click_button 'Create User'

		expect(current_path).to eq(user_path(User.last))

		expect(page).to have_text("User Name")
		expect(page).to have_text("user@example.com")
		expect(page).not_to have_text("password")
	end

	it "does not save a user if it is invalid" do 
		visit new_user_path

		expect { 
      click_button 'Create User' 
    }.not_to change(User, :count)
        
    expect(page).to have_text('error')
	end

	it "is not an admin user by default" do 
		user = User.new(user_attributes)

		visit root_path

		expect(page).not_to have_text("admin")
	end
end