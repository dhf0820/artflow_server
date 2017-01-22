require 'test_helper'

class CasinoCardArtRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @casino_card_art_request = casino_card_art_requests(:one)
  end

  test "should get index" do
    get casino_card_art_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_casino_card_art_request_url
    assert_response :success
  end

  test "should create casino_card_art_request" do
    assert_difference('CasinoCardArtRequest.count') do
      post casino_card_art_requests_url, params: { casino_card_art_request: { card_type_id: @casino_card_art_request.card_type_id, customer_details: @casino_card_art_request.customer_details, customer_email: @casino_card_art_request.customer_email, customer_id: @casino_card_art_request.customer_id, customer_name: @casino_card_art_request.customer_name, customer_phone: @casino_card_art_request.customer_phone, job_no: @casino_card_art_request.job_no, paper_type_id: @casino_card_art_request.paper_type_id } }
    end

    assert_redirected_to casino_card_art_request_url(CasinoCardArtRequest.last)
  end

  test "should show casino_card_art_request" do
    get casino_card_art_request_url(@casino_card_art_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_casino_card_art_request_url(@casino_card_art_request)
    assert_response :success
  end

  test "should update casino_card_art_request" do
    patch casino_card_art_request_url(@casino_card_art_request), params: { casino_card_art_request: { card_type_id: @casino_card_art_request.card_type_id, customer_details: @casino_card_art_request.customer_details, customer_email: @casino_card_art_request.customer_email, customer_id: @casino_card_art_request.customer_id, customer_name: @casino_card_art_request.customer_name, customer_phone: @casino_card_art_request.customer_phone, job_no: @casino_card_art_request.job_no, paper_type_id: @casino_card_art_request.paper_type_id } }
    assert_redirected_to casino_card_art_request_url(@casino_card_art_request)
  end

  test "should destroy casino_card_art_request" do
    assert_difference('CasinoCardArtRequest.count', -1) do
      delete casino_card_art_request_url(@casino_card_art_request)
    end

    assert_redirected_to casino_card_art_requests_url
  end
end
