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
end
