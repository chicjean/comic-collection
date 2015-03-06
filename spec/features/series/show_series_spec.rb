require 'spec_helper'

describe "Viewing an individual series" do 

	before do 
		@series = Series.create!(series_attributes)

		user = User.create!(user_attributes)
		sign_in(user)
	end

	it "shows the series title" do 
		visit series_path(@series)

		expect(page).to have_text(@series.name)
	end

	it "does not show a link to delete a comic when a user is not an admin" do 
		comic = @series.comics.create!(comic_attributes)

		visit series_path(@series)

		within_table('#show-comics')do
			expect(page).not_to have_text("Delete")
		end
	end

	context "when a series has comics" do

		it "lists the series' comics details" do 
			comic = @series.comics.create!(comic_attributes)

			visit series_path(@series)

			expect(page).to have_text(comic.number)
			expect(page).to have_text(comic.title)
			expect(page).to have_text(comic.redemption_code)
		end

		it "does not show the redemption code when a redemption code has been redeemed" do 
			comic = @series.comics.create!(comic_attributes(redeemed: true))

			visit series_path(@series)

			within_table('#show-comics') do 
				expect(page).not_to have_text(comic.redemption_code)
			end
		end
		
		it "shows the redemption code when a redemption code has not been redeemed" do 
			comic = @series.comics.create!(comic_attributes(redeemed: false))

			visit series_path(@series)

			within_table('#show-comics') do 
				expect(page).to have_text(comic.redemption_code)
			end
		end

	end

	context "when a series does not have comics" do

		before do 
			visit series_path(@series)
		end

		it "does not show a list of comics" do 
			expect(page).to have_text("Add a New Comic")

			expect(page).not_to have_text("Issue #")
			expect(page).not_to have_text("Redeem")
		end

		it "shows a link to add a new comic" do 
			click_link "Add a New Comic"

			expect(current_path).to eq(new_series_comic_path(@series))
		end

	end

end

describe "Viewing an individual series when a user is an admin" do 

		before do 
			@series = Series.create!(series_attributes)

			admin_user = User.create!(user_attributes(admin: true))
			sign_in(admin_user)
		end

		it "shows a link to delete a comic" do 
			comic = @series.comics.create!(comic_attributes)

			visit series_path(@series)

			within_table('#show-comics')do
				expect(page).to have_text("Delete")
			end
		end
	
end