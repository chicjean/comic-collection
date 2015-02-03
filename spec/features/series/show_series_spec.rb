require 'spec_helper'

describe "Viewing an individual series" do 

	it "shows the series title" do 
		series = Series.create!(series_attributes)

		visit series_path(series)

		expect(page).to have_text(series.name)
	end
end