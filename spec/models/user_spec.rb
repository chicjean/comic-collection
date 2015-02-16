require 'spec_helper'

describe "A user" do 

	it "requires a name" do
		user = User.new(name: "")

		user.valid?

		expect(user.errors[:name].any?).to eq(true)
	end

	it "requires an email" do 
		user = User.new(email: "")

		user.valid?

		expect(user.errors[:email].any?).to eq(true)
	end

	it "requires a unique email"

	it "requires a password" do 
		user = User.new(email: "")

		user.valid?

		expect(user.errors[:password].any?).to eq(true)
	end

	it "requires a password confirmation when a password is present"

	it "requires the password to match the password confirmation"

	it "automatically encrypts the password into the password_digest attribute" 
end