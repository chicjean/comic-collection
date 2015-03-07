require 'rails_helper'

describe 'Viewing the list of series' do 

	before do
		@series1 = Series.create!(name: "Rocket Raccoon")
		@series2 = Series.create!(name: "Superior Spiderman")
		@series3 = Series.create!(name: "Uncanny X-Men")

		user = User.create!(user_attributes)

		sign_in(user)
	end

	it "shows the series" do 
		visit series_index_url

		expect(page).to have_text(@series1.name)
		expect(page).to have_text(@series2.name)
		expect(page).to have_text(@series3.name)
	end

end