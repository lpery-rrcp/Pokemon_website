require "test_helper"

class TypeControllerTest < ActionDispatch::IntegrationTest
  test "should get name:" do
    get type_name:_url
    assert_response :success
  end
end
