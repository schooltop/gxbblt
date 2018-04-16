require 'test_helper'

class IndustryesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @industrye = industryes(:one)
  end

  test "should get index" do
    get industryes_url
    assert_response :success
  end

  test "should get new" do
    get new_industrye_url
    assert_response :success
  end

  test "should create industrye" do
    assert_difference('Industrye.count') do
      post industryes_url, params: { industrye: {  } }
    end

    assert_redirected_to industrye_url(Industrye.last)
  end

  test "should show industrye" do
    get industrye_url(@industrye)
    assert_response :success
  end

  test "should get edit" do
    get edit_industrye_url(@industrye)
    assert_response :success
  end

  test "should update industrye" do
    patch industrye_url(@industrye), params: { industrye: {  } }
    assert_redirected_to industrye_url(@industrye)
  end

  test "should destroy industrye" do
    assert_difference('Industrye.count', -1) do
      delete industrye_url(@industrye)
    end

    assert_redirected_to industryes_url
  end
end
