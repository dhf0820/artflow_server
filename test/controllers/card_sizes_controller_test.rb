require 'test_helper'

class CardSizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_size = card_sizes(:one)
  end

  test "should get index" do
    get card_sizes_url
    assert_response :success
  end

  test "should get new" do
    get new_card_size_url
    assert_response :success
  end

  test "should create card_size" do
    assert_difference('CardSize.count') do
      post card_sizes_url, params: { card_size: { code: @card_size.code, height: @card_size.height, name: @card_size.name, width: @card_size.width } }
    end

    assert_redirected_to card_size_url(CardSize.last)
  end

  test "should show card_size" do
    get card_size_url(@card_size)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_size_url(@card_size)
    assert_response :success
  end

  test "should update card_size" do
    patch card_size_url(@card_size), params: { card_size: { code: @card_size.code, height: @card_size.height, name: @card_size.name, width: @card_size.width } }
    assert_redirected_to card_size_url(@card_size)
  end

  test "should destroy card_size" do
    assert_difference('CardSize.count', -1) do
      delete card_size_url(@card_size)
    end

    assert_redirected_to card_sizes_url
  end
end
