require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "can be created" do
    assert_difference 'Voter.count' do
      post :create, {name: "Muffin Man", hometown: "Drury, PA"}
    end
  end
end
