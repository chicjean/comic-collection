def series_attributes(overrides = {})
  random_number = (0..9).to_a.shuffle[0..10].join
  {
    name: "Uncanny X-Men #{random_number}",
  }.merge(overrides)
end

def comic_attributes(overrides = {})
	random_number = (0..9).to_a.shuffle[1..10].join
	{
		title: "Issue #1", 
		number: "#{random_number}", 
		redemption_code: "123XYZ#{random_number}"
	}.merge(overrides)
end

# def user_attribues(overrides = {})
# 	{
# 		name: "User Name", 
# 		email: "user@example.com",
# 		password: "password",
# 		password_confirmation: "password"
# 	}.merge(overrides)
# end