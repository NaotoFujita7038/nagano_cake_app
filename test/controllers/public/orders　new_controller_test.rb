require "test_helper"

class Public::Orders　newControllerTest < ActionDispatch::IntegrationTest
  test "should get thanks" do
    get public_orders　new_thanks_url
    assert_response :success
  end

  test "should get index" do
    get public_orders　new_index_url
    assert_response :success
  end

  test "should get show" do
    get public_orders　new_show_url
    assert_response :success
  end
end
