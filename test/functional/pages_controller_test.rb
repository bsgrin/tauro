require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get portfolio" do
    get :portfolio
    assert_response :success
  end

  test "should get production" do
    get :production
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end

end
