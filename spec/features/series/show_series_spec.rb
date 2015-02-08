require 'spec_helper'

describe "Viewing an individual series" do 

	before do 
		@series = Series.create!(series_attributes)
	end

	it "shows the series title" do 
		visit series_path(@series)

		expect(page).to have_text(@series.name)
	end

	context "when a series has comics" do

		before do 
			@comic = @series.comics.create!(comic_attributes)
			visit series_path(@series)
		end

		it "lists the comics details" do 
			expect(page).to have_text(@comic.number)
			expect(page).to have_text(@comic.title)
			expect(page).to have_text(@comic.redemption_code)
		end

		it "provides a link to toggle redemption status from uredeemed to redeemed"

		it "provides a link to toggle redemption status from redeemed to unredeemed"
		
	end

end