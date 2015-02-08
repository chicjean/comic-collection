class Series < ActiveRecord::Base
	has_many :comics, dependent: :destroy

	validates :name, presence: true, uniqueness: {case_sensitive: false }

	#scope :alpha_sort, -> {order(name: :asc)}
	#Not case insensitive
	
	def self.alpha_sort
		order ("lower(name) ASC")
	end
	
end
