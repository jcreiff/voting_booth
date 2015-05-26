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
end
