class Comic < ActiveRecord::Base
  belongs_to :series

  validates :number, presence: true
  validates :redemption_code, presence: true, uniqueness: true
  
  scope :issue_sort, -> { joins(:series).order(number: :asc)}
  scope :redeemed, -> { issue_sort.where(redeemed: true) }
  scope :unredeemed, -> { issue_sort.where(redeemed: false) }

end 