require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "votes count" do
    number_of_votes = Vote.count

    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    keith = Voter.create(name: "Keith Richards")
    one = Vote.create(voter_id: keith.id, candidate_id: rick.id)

    assert_equal 1, Vote.count - number_of_votes
    assert_equal rick, one.candidate
    assert_equal keith, one.voter
  end
end
