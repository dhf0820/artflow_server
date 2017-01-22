require 'test_helper'

class ArtRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @art_request = art_requests(:one)
  end

  test "should get index" do
    get art_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_art_request_url
    assert_response :success
  end

  test "should create art_request" do
    assert_difference('ArtRequest.count') do
      post art_requests_url, params: { art_request: { art_requested_by: @art_request.art_requested_by, comments: @art_request.comments, customer_details: @art_request.customer_details, customer_email: @art_request.customer_email, customer_id: @art_request.customer_id, customer_name: @art_request.customer_name, customer_phone: @art_request.customer_phone, ship_date: @art_request.ship_date } }
    end

    assert_redirected_to art_request_url(ArtRequest.last)
  end

  test "should show art_request" do
    get art_request_url(@art_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_art_request_url(@art_request)
    assert_response :success
  end

  test "should update art_request" do
    patch art_request_url(@art_request), params: { art_request: { art_requested_by: @art_request.art_requested_by, comments: @art_request.comments, customer_details: @art_request.customer_details, customer_email: @art_request.customer_email, customer_id: @art_request.customer_id, customer_name: @art_request.customer_name, customer_phone: @art_request.customer_phone, ship_date: @art_request.ship_date } }
    assert_redirected_to art_request_url(@art_request)
  end

  test "should destroy art_request" do
    assert_difference('ArtRequest.count', -1) do
      delete art_request_url(@art_request)
    end

    assert_redirected_to art_requests_url
  end
end
