class Voter < ActiveRecord::Base

  has_one :vote
  has_one :candidate, through: :vote
  has_one :api_key

  validates :name, presence: true

end
