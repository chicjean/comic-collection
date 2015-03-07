require 'rails_helper'

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
		let(:series) { Series.create!(series_attributes) }

		let(:comic1) { series.comics.create!(comic_attributes(redeemed: true, number: 18)) }
		let(:comic2) { series.comics.create!(comic_attributes(redeemed: false, number: 2)) }
		let(:comic3) { series.comics.create!(comic_attributes(redeemed: false, number: 99)) }
		let(:comic4) { series.comics.create!(comic_attributes(redeemed: true, number: 7)) }

		it "shows all the series' comics sorted by issue number in ascending order" do 
			expect(series.comics.issue_sort).to eq([comic2, comic4, comic1, comic3])
		end

		it "shows only the redeemed series' comics by issue number in ascending order" do 
			expect(series.comics.redeemed).to eq([comic4, comic1])

			expect(series.comics.redeemed).not_to eq([comic2, comic3])
		end

		it "shows only the unredeemed series' comics by issue number in ascending order" do 
			expect(series.comics.unredeemed).to eq([comic2, comic3])

			expect(series.comics.unredeemed).not_to eq([comic4, comic1])
		end
	end

end