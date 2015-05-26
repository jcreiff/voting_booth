require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  test "name validation" do
    mick = Voter.new(name: "Mick Jagger")
    keith = Voter.new(name: "Keith Richards")
    some_rando = Voter.new(name: "")

    assert mick.save
    assert keith.save
    refute some_rando.save
  end

  test "associated with vote" do
    mick = Voter.create(name: "Mick Jagger")
    keith = Voter.create(name: "Keith Richards")

    one = Vote.create(voter: mick, candidate_id: 3)
    two = Vote.create(voter: keith, candidate_id: 3)

    assert_equal one, mick.vote
    assert_equal two, keith.vote
  end

  test "associated with candidate" do
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    jim = Candidate.create(name: "Jim Jameson", hometown: "Harlan, KY",
      district: "KY-3", party: "Republican")

    mick = Voter.create(name: "Mick Jagger")
    keith = Voter.create(name: "Keith Richards")

    Vote.create(voter: mick, candidate: rick)
    Vote.create(voter: keith, candidate: jim)

    assert_equal rick, mick.candidate
    assert_equal jim, keith.candidate
  end

end
