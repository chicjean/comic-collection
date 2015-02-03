require 'spec_helper'

describe "Creating a series" do 

	it "saves the series and show's the new series show page" do 
		visit series_index_url

		click_link "Add Series"

		expect(current_path).to eq(new_series_path)

		fill_in "Name", with: "The Wizard of Oz"

		click_button "Create Series"

		expect(current_path).to eq(series_path(Series.last))

		expect(page).to have_text("The Wizard of Oz")
		expect(page).to have_text("Series successfully created!")
	end

	it "does not save a series if it is invalid" do 
		visit new_series_url

		expect { 
      click_button 'Create Series' 
    }.not_to change(Series, :count)
        
    expect(page).to have_text('error')
	end

end