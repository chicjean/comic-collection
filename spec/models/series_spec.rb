require 'spec_helper'

describe "A series" do

	it "requires a name" do 
		series = Series.new(name: "")
    
    series.valid? # populates errors
    
    expect(series.errors[:name].any?).to eq(true)
	end

end
