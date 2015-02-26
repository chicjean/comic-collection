require 'spec_helper'

describe "Creating a comic" do 

	before do 
		user = User.create!(user_attributes)
		sign_in(user)

		@series = Series.create!(series_attributes)
	end

	it "saves the comic and shows it on the series show page" do 
		visit new_series_comic_path(@series)

		fill_in "Issue Number", with: "22"
		fill_in "Redemption Code", with: "246ABC"
		fill_in "Title", with: "Comic Title"

		click_button 'Create Comic'

		expect(current_path).to eq(series_path(@series))

		expect(page).to have_text("22")
		expect(page).to have_text("246ABC")
		expect(page).to have_text("Comic Title")
	end

	it "does not save a comic if it is invalid" do 
		visit new_series_comic_path(@series)

		click_button "Create Comic"

		expect(current_path).to eq(current_path)

		expect(page).to have_text("error")
	end

end