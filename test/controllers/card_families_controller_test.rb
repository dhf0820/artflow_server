require 'test_helper'

class CardFamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_family = card_families(:one)
  end

  test "should get index" do
    get card_families_url
    assert_response :success
  end

  test "should get new" do
    get new_card_family_url
    assert_response :success
  end

  test "should create card_family" do
    assert_difference('CardFamily.count') do
      post card_families_url, params: { card_family: { code: @card_family.code, desc: @card_family.desc, side: @card_family.side } }
    end

    assert_redirected_to card_family_url(CardFamily.last)
  end

  test "should show card_family" do
    get card_family_url(@card_family)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_family_url(@card_family)
    assert_response :success
  end

  test "should update card_family" do
    patch card_family_url(@card_family), params: { card_family: { code: @card_family.code, desc: @card_family.desc, side: @card_family.side } }
    assert_redirected_to card_family_url(@card_family)
  end

  test "should destroy card_family" do
    assert_difference('CardFamily.count', -1) do
      delete card_family_url(@card_family)
    end

    assert_redirected_to card_families_url
  end
end
