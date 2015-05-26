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

  test "no phantom votes" do
    one = Vote.new(candidate_id: 1, voter_id: 3)
    two = Vote.new(voter_id: 4)
    three = Vote.new(candidate_id: 5)

    assert one.save
    refute two.save
    refute three.save
  end

  test "one vote per voter" do
    one = Vote.new(candidate_id: 3, voter_id: 3)
    two = Vote.new(candidate_id: 3, voter_id: 4)
    three = Vote.new(candidate_id: 3, voter_id: 3)
    four = Vote.new(candidate_id: 4, voter_id: 3)

    assert one.save
    assert two.save
    refute three.save
    refute four.save
  end
  
end
