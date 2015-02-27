require 'spec_helper'

describe "A series" do

	it "has many comics" do 
		series = Series.new(series_attributes)

		comic1 = series.comics.new(comic_attributes)
		comic2 = series.comics.new(comic_attributes)

		expect(series.comics).to include(comic1)
		expect(series.comics).to include(comic2)
	end

	it "deletes associated comics" do 
		series = Series.create!(series_attributes)

		series.comics.create!(comic_attributes)

		expect{series.destroy}.to change(Comic, :count).by(-1)
	end

	it "is valid with example attributes" do 
		series = Series.new(series_attributes)

		series.valid?

		expect(series.errors.any?).to eq(false)
	end

	it "requires a name" do 
		series = Series.new(name: "")
    
    series.valid?
    
    expect(series.errors[:name].any?).to eq(true)
	end

	it "requires a unique name" do 
		series1 = Series.create!(series_attributes)
		series2 = Series.new(name: series1.name)

		series2.valid?

		expect(series2.errors[:name].any?).to eq(true)
	end

	it "sorts series by title alphabetically"

	
end
