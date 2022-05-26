require "test_helper"

class RecipiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipies_index_url
    assert_response :success
  end

  test "should get show" do
    get recipies_show_url
    assert_response :success
  end

  test "should get new" do
    get recipies_new_url
    assert_response :success
  end

  test "should get create" do
    get recipies_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recipies_destroy_url
    assert_response :success
  end
end
