class Candidate < ActiveRecord::Base

  has_many :votes, dependent: :restrict_with_error
  has_many :voters, through: :votes

end
