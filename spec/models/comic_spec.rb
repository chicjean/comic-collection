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

	context "when filted with scopes" do 
		@series = Series.create!(series_attributes)

		@comic1 = @series.comics.create!(comic_attributes(redeemed: true, number: 18))
		@comic2 = @series.comics.create!(comic_attributes(redeemed: false, number: 2))
		@comic3 = @series.comics.create!(comic_attributes(redeemed: false, number: 99))
		@comic4 = @series.comics.create!(comic_attributes(redeemed: true, number: 7))

		it "shows all the series' comics sorted by issue number in ascending order" do 
			@series.comics.issue_sort.should == [@comic2, @comic4, @comic1, @comic3]
		end

		it "shows only the redeemed series' comics by issue number in ascending order" do 
			@series.comics.redeemed.should == [@comic4, @comic1]
		end

		it "shows only the unredeemed series' comics by issue number in ascending order" do 
			@series.comics.unredeemed.should == [@comic2, @comic3]
		end
	end

end