class User < ActiveRecord::Base
  has_secure_password

  before_save :format_email
  
  validates :name, presence: true

  validates :email, presence: true, 
			  			uniqueness: {case_sensitive: false }, 
			  			format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, 
			  			length: { minimum: 10, allow_blank: true }

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user && user.authenticate(password)
	end

	def format_email
    self.email = email.downcase
  end

end
