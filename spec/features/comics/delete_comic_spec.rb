require 'rails_helper'

describe "Deleting a comic" do 

	before do
		admin = User.create!(user_attributes(admin: true))

		sign_in(admin)
	end

	it "destroys the comic and shows the series show page without that comic" do 
		series = Series.create!(series_attributes)

		comic = series.comics.create!(comic_attributes)

		visit series_path(series)

		expect(page).to have_text(comic.title)

		click_link "Delete"

		expect(current_path).to eq(series_path(series))
		expect(page).not_to have_text(comic.title)
		expect(page).to have_text("Comic successfully deleted")
	end 
		
end