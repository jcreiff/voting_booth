class Vote < ActiveRecord::Base

  require 'byebug'

  belongs_to :candidate
  belongs_to :voter

  validates :voter_id, presence: true, uniqueness: true
  validates :candidate_id, presence: true

  def self.display_total
    num = Candidate.count
    display_hash = {}
    (1..num).to_a.each do |n|
      vote = Vote.where(candidate_id: "#{n}").first
      voted_for = vote.candidate.name
      display_hash[voted_for] = Vote.where(candidate_id: "#{n}").count
    end
    display_hash
  end

end
