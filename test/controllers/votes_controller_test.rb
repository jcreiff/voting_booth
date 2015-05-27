require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "can be created" do
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    tim = Voter.create(name: "Tim Thompson", hometown: "Abingdon, VA")
    assert_difference 'Vote.count' do
      post :create, {voter_id: tim.id, candidate_id: rick.id}
    end
  end


end
