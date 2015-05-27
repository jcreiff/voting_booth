require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  test "can be created" do
    assert_difference 'Voter.count' do
      post :create, {name: "Muffin Man", hometown: "Drury, PA"}
    end
  end

  test "can show by id" do
    tim = Voter.create(name: "Tim Thompson", hometown: "Abingdon, VA")
    ralph = Voter.create(name: "Ralph Stanley", hometown: "Johnson City, TN")

    get :show, id: tim.id
    assert response.body =~ /Thompson/
  end

  test "can update" do
    tim = Voter.create(name: "Tim Thompson", hometown: "Abingdon, VA")
    ralph = Voter.create(name: "Ralph Stanley", hometown: "Johnson City, TN")

    patch :update, {id: tim.id, party: "Independent"}
    assert response.body =~ /Independent/
  end
end
