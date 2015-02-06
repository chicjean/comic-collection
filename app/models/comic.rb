class Comic < ActiveRecord::Base
  belongs_to :series

  validates :number, :redemption_code, presence: true, uniqueness: true

end
