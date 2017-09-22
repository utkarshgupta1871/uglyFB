require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get myFriends" do
    get friendships_myFriends_url
    assert_response :success
  end

end
