require 'spec_helper'

describe "A series" do

	it "has many comics"

	it "deletes associated comics"

	it "requires a name" do 
		series = Series.new(name: "")
    
    series.valid?
    
    expect(series.errors[:name].any?).to eq(true)
	end

	it "requires a unique name"

	it "sorts series by title alphabetically"

	it "is valid with example attributes"

end
