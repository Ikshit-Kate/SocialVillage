require "test_helper"

class BroadcastsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get broadcasts_index_url
    assert_response :success
  end
end
