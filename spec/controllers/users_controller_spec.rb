require 'spec_helper'

describe UsersController do

	before do 
		user = User.create!(user_attributes)
	end

	context "when not signed in " do 

		it "cannot view the user"

		it "cannot updated the user"

		it "cannot destroy the user"

	end

	context "when signed in as the wrong user" do 

		it "cannot view another user"

		it "cannot updated another user"

		it "cannot destroy another user"

	end
 
end
