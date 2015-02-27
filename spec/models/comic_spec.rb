require 'spec_helper'

describe "A comic" do 
	
	it "belongs to a series" do
		series = Series.create(series_attributes)

    comic = series.comics.new(comic_attributes)

    expect(comic.series).to eq(series)
  end

  it "is valid with example attributes" do 
  	comic = Comic.new(comic_attributes)

  	comic.valid?

  	expect(comic.errors.any?).to eq(false)
  end

	it "requires an issue number" do 
		comic = Comic.new(number: "")

    comic.valid?

    expect(comic.errors[:number].any?).to eq(true)
	end

	it "requires a redemption code" do 
		comic = Comic.new(redemption_code: "")

		comic.valid?

		expect(comic.errors[:redemption_code].any?).to eq(true)
	end

	it "has a redemption status of false when created" do 
		comic = Comic.new(comic_attributes)

		expect(comic.redeemed).to eq(false)

	end

	it "HOW DO I WRITE A TEST FOR MY SCOPES?"

	it "shows the series' comics sorted by issue number"

end