require 'rails_helper'

describe "Navigating series" do 

	before do
		user = User.create!(user_attributes)

		sign_in(user)
	end

	it "allows navigation from the main show page to the series page" do 
		series = Series.create!(series_attributes)

		visit series_index_path

		click_link series.name

		expect(current_path).to eq(series_path(series))
		expect(page).to have_text(series.name)
	end 

	it "allows navigation from the series page to the main show page" do 
		series = Series.create!(series_attributes)

		visit series_path(series)

		click_link "All Series"

		expect(current_path).to eq(series_index_path)
	end

end