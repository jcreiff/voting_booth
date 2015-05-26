class Voter < ActiveRecord::Base

  has_one :vote
  has_one :candidate, through: :vote

  validates :name, presence: true

end
