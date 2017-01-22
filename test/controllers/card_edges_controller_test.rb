require 'test_helper'

class CardEdgesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_edge = card_edges(:one)
  end

  test "should get index" do
    get card_edges_url
    assert_response :success
  end

  test "should get new" do
    get new_card_edge_url
    assert_response :success
  end

  test "should create card_edge" do
    assert_difference('CardEdge.count') do
      post card_edges_url, params: { card_edge: { desc: @card_edge.desc, name: @card_edge.name, ref_image_url: @card_edge.ref_image_url } }
    end

    assert_redirected_to card_edge_url(CardEdge.last)
  end

  test "should show card_edge" do
    get card_edge_url(@card_edge)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_edge_url(@card_edge)
    assert_response :success
  end

  test "should update card_edge" do
    patch card_edge_url(@card_edge), params: { card_edge: { desc: @card_edge.desc, name: @card_edge.name, ref_image_url: @card_edge.ref_image_url } }
    assert_redirected_to card_edge_url(@card_edge)
  end

  test "should destroy card_edge" do
    assert_difference('CardEdge.count', -1) do
      delete card_edge_url(@card_edge)
    end

    assert_redirected_to card_edges_url
  end
end
