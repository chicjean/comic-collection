require 'rails_helper'

describe "Sigining In" do 

	it "asks a user for their email and password" do 
		visit new_session_path 

		expect(page).to have_text("Email")
		expect(page).to have_text("Password")
	end

	it "acepts a valid email address and password combination" do 

		user = User.create!(user_attributes)

		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Sign In"

		expect(current_path).to eq(series_index_path)
		expect(page).to have_text("Welcome Back")
	end

	it "rejects an invald email address and password combination" do 

		user = User.create!(user_attributes)

		visit new_session_path

		fill_in "Email", with: user.email
		fill_in "Password", with: "wrongpassword"

		click_button "Sign In"

		expect(current_path).to eq(current_path)
		expect(page).to have_text("Invalid Email/Password")
	end

end