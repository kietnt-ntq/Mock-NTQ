require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get content" do
    get home_content_url
    assert_response :success
  end

end
