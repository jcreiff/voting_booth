require 'test_helper'

class CandidateTest < ActiveSupport::TestCase

  test "info validation" do
    rick = Candidate.new(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    jim = Candidate.new(name: "Jim Jameson", hometown: "Harlan, KY",
      district: "KY-3")
    ralph = Candidate.new(name: "Ralph McGill", hometown: "Atlanta, GA",
      party: "Democrat")
    hillary = Candidate.new(name: "Hillary Clinton", district: "NY-4",
      party: "Democrat")
    some_rando = Candidate.new(hometown: "Lincoln, NE", district: "NE-2",
      party: "Republican")

    assert rick.save
    refute jim.save
    refute ralph.save
    refute hillary.save
    refute some_rando.save
  end

  test "associated with votes" do
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    jim = Candidate.create(name: "Jim Jameson", hometown: "Harlan, KY",
      district: "KY-3", party: "Republican")

    one = Vote.create(candidate_id: rick.id, voter_id: 7)
    two = Vote.create(candidate_id: rick.id, voter_id: 8)
    three = Vote.create(candidate_id: jim.id, voter_id: 9)

    assert_equal [one, two], rick.votes
    assert_equal [three], jim.votes
  end

  test "associated with voters" do
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    jim = Candidate.create(name: "Jim Jameson", hometown: "Harlan, KY",
      district: "KY-3", party: "Republican")

    mick = Voter.create(name: "Mick Jagger")
    keith = Voter.create(name: "Keith Richards")
    jimi = Voter.create(name: "Jimi Hendrix")

    Vote.create(voter: mick, candidate: rick)
    Vote.create(voter: keith, candidate: rick)
    Vote.create(voter: jimi, candidate: jim)

    assert_equal [mick, keith], rick.voters
    assert_equal [jimi], jim.voters

  end
end
