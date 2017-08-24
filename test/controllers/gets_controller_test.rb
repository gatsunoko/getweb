require 'test_helper'

class GetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gets_index_url
    assert_response :success
  end

end
