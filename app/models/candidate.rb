class Candidate < ActiveRecord::Base

  has_many :votes, dependent: :restrict_with_error
  has_many :voters, through: :votes

  validates :name, presence: true, :hometown, presence: true,
    :district, presence: true, :party, presence: true

end
