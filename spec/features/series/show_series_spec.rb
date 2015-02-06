require 'spec_helper'

describe "Viewing an individual series" do 

	it "shows the series title" do 
		series = Series.create!(series_attributes)

		visit series_path(series)

		expect(page).to have_text(series.name)
	end

	it "lists a series comics" do 
		series = Series.create!(series_attributes)

		comic = series.comics.create!(
			title: "Issue #1", 
			number: "1", 
			redemption_code: "123XYZ"
			)

		visit series_path(series)

		expect(page).to have_text(comic.title)
	end
	
end