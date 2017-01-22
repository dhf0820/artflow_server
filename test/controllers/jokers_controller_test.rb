require 'test_helper'

class JokersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @joker = jokers(:one)
  end

  test "should get index" do
    get jokers_url
    assert_response :success
  end

  test "should get new" do
    get new_joker_url
    assert_response :success
  end

  test "should create joker" do
    assert_difference('Joker.count') do
      post jokers_url, params: { joker: { code: @joker.code, image_url: @joker.image_url, name: @joker.name } }
    end

    assert_redirected_to joker_url(Joker.last)
  end

  test "should show joker" do
    get joker_url(@joker)
    assert_response :success
  end

  test "should get edit" do
    get edit_joker_url(@joker)
    assert_response :success
  end

  test "should update joker" do
    patch joker_url(@joker), params: { joker: { code: @joker.code, image_url: @joker.image_url, name: @joker.name } }
    assert_redirected_to joker_url(@joker)
  end

  test "should destroy joker" do
    assert_difference('Joker.count', -1) do
      delete joker_url(@joker)
    end

    assert_redirected_to jokers_url
  end
end
