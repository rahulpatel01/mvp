require 'test_helper'

class HelpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get help_index_url
    assert_response :success
  end

  test "should get new" do
    get help_new_url
    assert_response :success
  end

  test "should get create" do
    get help_create_url
    assert_response :success
  end

end
