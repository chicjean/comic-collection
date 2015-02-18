require 'spec_helper'

describe "Sigining In" do 

	it "asks a user for their email and password" do 
		visit root_url 

		click_link "Sign In"

		expect(current_path).to eq(new_session_path)
		expect(page).to have_text("Email")
		expect(page).to have_text("Password")
	end

	it "rejects an invald email address and password confirmation"
end