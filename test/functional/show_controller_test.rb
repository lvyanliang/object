require 'test_helper'

class ShowControllerTest < ActionController::TestCase
  test "should get show_tkrp" do
    get :show_tkrp
    assert_response :success
  end

  test "should get show_tcrp" do
    get :show_tcrp
    assert_response :success
  end

end
