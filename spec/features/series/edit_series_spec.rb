require 'spec_helper'

describe "Editing a series" do 

	it "updates the series title and shows the updated series name" do 
		series = Series.create!(series_attributes)

		visit edit_series_path(series)

		find('#name-field').set("Batman")

		click_button "Update Series"

		expect(current_path).to eq(series_path(series))
		expect(page).to have_text("Batman")
		expect(page).to have_text("Series successfully updated!")
	end

	it "does not update the series if it is invalid" do 
		series1 = Series.create!(series_attributes)
		series2 = Series.create!(name: "Batman")

		visit edit_series_path(series1)

		find('#name-field').set("Batman")

		click_button "Update Series"

		expect(page).to have_text("error")
	end

end