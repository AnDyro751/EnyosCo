require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_home_url
    assert_response :success
  end

  test "should get unregistered" do
    get main_unregistered_url
    assert_response :success
  end

  test "should get helper" do
    get main_helper_url
    assert_response :success
  end

end
