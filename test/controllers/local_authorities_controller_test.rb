require "test_helper"

class LocalAuthoritiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get local_authorities_index_url
    assert_response :success
  end

  test "should get new" do
    get local_authorities_new_url
    assert_response :success
  end

  test "should get edit" do
    get local_authorities_edit_url
    assert_response :success
  end
end
