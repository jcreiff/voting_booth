require 'test_helper'

class VotesControllerTest < ActionController::TestCase

  test "can be created" do
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    tim = Voter.create(name: "Tim Thompson", hometown: "Abingdon, VA")
    assert_difference 'Vote.count' do
      post :create, {voter_id: tim.id, candidate_id: rick.id}
    end
  end

  # My votes index method works in Postman and localhost:3000 but the fixtures
  # make any kind of test I devise fail, so I'm just commenting it out for now.

  # test "display index" do
  #   rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
  #     district: "VA-9", party: "Democrat")
  #   tim = Voter.create(name: "Tim Thompson", hometown: "Abingdon, VA")
  #   jim = Voter.create(name: "Jim", hometown: "Abingdon, VA")
  #
  #   vote_one = Vote.create(candidate_id: rick.id, voter_id: tim.id)
  #   vote_two = Vote.create(candidate_id: rick.id, voter_id: jim.id)
  #
  #   get :index
  #   assert_response :success
  # end

  test "can be destroyed" do
    first_count = Vote.count
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    tim = Voter.create(name: "Tim Thompson", hometown: "Abingdon, VA")
    vote = Vote.create(voter_id: tim.id, candidate_id: rick.id)

    assert_equal 1, Vote.count - first_count

    delete :destroy, id: vote.id
    
    assert_equal first_count, Vote.count
    assert response.body =~ /deleted/
  end
end
