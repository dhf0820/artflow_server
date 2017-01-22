require 'test_helper'

class CardColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_color = card_colors(:one)
  end

  test "should get index" do
    get card_colors_url
    assert_response :success
  end

  test "should get new" do
    get new_card_color_url
    assert_response :success
  end

  test "should create card_color" do
    assert_difference('CardColor.count') do
      post card_colors_url, params: { card_color: { c: @card_color.c, k: @card_color.k, m: @card_color.m, name: @card_color.name, y: @card_color.y } }
    end

    assert_redirected_to card_color_url(CardColor.last)
  end

  test "should show card_color" do
    get card_color_url(@card_color)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_color_url(@card_color)
    assert_response :success
  end

  test "should update card_color" do
    patch card_color_url(@card_color), params: { card_color: { c: @card_color.c, k: @card_color.k, m: @card_color.m, name: @card_color.name, y: @card_color.y } }
    assert_redirected_to card_color_url(@card_color)
  end

  test "should destroy card_color" do
    assert_difference('CardColor.count', -1) do
      delete card_color_url(@card_color)
    end

    assert_redirected_to card_colors_url
  end
end
