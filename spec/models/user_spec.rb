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

	it "requires a unique email" do 
		user1 = User.create!(user_attributes)
		user2 = User.new(email: user1.email)

		user2.valid?

		expect(user2.errors[:email].any?).to eq(true)
	end

	it "requires a properly formatted email"

	it "rejects a duplicate email" 

	it "requires a password" do 
		user = User.new(email: "")

		user.valid?

		expect(user.errors[:password].any?).to eq(true)
	end

	it "requires a password confirmation when a password is present"

	it "requires the password to match the password confirmation"

	it "automatically encrypts the password into the password_digest attribute" 

	it "does not require a password when updating"

	it "is valid with example attributes"
end

describe "authenticate" do
  before do
    @user = User.create!(user_attributes)
  end

  it "returns non-true value if the email does not match" do
    expect(User.authenticate("nomatch", @user.password)).not_to eq(true)
  end

  it "returns non-true value if the password does not match" do
    expect(User.authenticate(@user.email, "nomatch")).not_to eq(true)
  end

  it "returns the user if the email and password match" do
    expect(User.authenticate(@user.email, @user.password)).to eq(@user)
  end
end