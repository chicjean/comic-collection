require 'spec_helper'

describe "Filtering the comics for a series" do 

	before do 
		@series = Series.create!(series_attributes)

		@comic1 = @series.comics.create!(comic_attributes(redeemed: true))
		@comic2 = @series.comics.create!(comic_attributes)

		user = User.create!(user_attributes)
		sign_in(user)
	end

	it "shows only redeemed comics" do 
		visit series_redeemed_path(@series)

		expect(page).to have_text(@comic1.title)
		expect(page).not_to have_text(@comic2.title)
	end

	it "shows only unredeemed comics" do 
		visit series_unredeemed_path(@series)

		expect(page).to have_text(@comic2.title)
		expect(page).not_to have_text(@comic1.title)
	end

end 