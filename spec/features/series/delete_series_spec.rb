require 'rails_helper'

describe "Deleting a series" do 

	it "if the user is an admin destroys the series and shows the main page without that series" do 
		admin_user = User.create!(user_attributes(admin: true))

		sign_in(admin_user)

		series = Series.create!(series_attributes)

		visit series_path(series)

		click_link "Delete Series"

		expect(current_path).to eq(series_index_path)
		expect(page).not_to have_text(series.name)
		expect(page).to have_text("Series deleted!")
	end

	it "does not show the option to delete is a user is not an admin" do 
		user = User.create!(user_attributes(admin: false))

		sign_in(user)

		series = Series.create!(series_attributes)

		visit series_path(series)

		expect(page).not_to have_text("Delete Series")
	end

end