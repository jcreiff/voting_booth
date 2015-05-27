require 'test_helper'
require 'byebug'

class CandidatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "can create" do
    assert_difference 'Candidate.count' do
      post :create, {name: "Will", hometown: "Bel-Air, CA", district: "CA-13",
      party: "Whigs"}
    end
  end

  test "can show by id" do
    rick = Candidate.create(name: "Rick Boucher", hometown: "Abingdon, VA",
      district: "VA-9", party: "Democrat")
    jim = Candidate.create(name: "Jim Jameson", hometown: "Harlan, KY",
      district: "KY-3", party: "Republican")

    get :show, id: jim.id
    assert response.body =~ /Jameson/
  end
end
