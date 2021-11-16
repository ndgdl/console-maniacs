require 'test_helper'

class ConsolesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get consoles_index_url
    assert_response :success
  end

  test "should get show" do
    get consoles_show_url
    assert_response :success
  end

end
