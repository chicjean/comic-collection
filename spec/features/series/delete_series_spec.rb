require 'spec_helper'

describe "Deleting a series" do 

	before do
		user = User.create!(user_attributes)

		sign_in(user)
	end

	it "destroys the series and shows the main page without that series" do 
		series = Series.create!(series_attributes)

		visit series_path(series)

		click_link "Delete"

		expect(current_path).to eq(series_index_path)
		expect(page).not_to have_text(series.name)
		expect(page).to have_text("Series deleted!")
	end

end