require 'test_helper'

class CustomerCardBacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_card_back = customer_card_backs(:one)
  end

  test "should get index" do
    get customer_card_backs_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_card_back_url
    assert_response :success
  end

  test "should create customer_card_back" do
    assert_difference('CustomerCardBack.count') do
      post customer_card_backs_url, params: { customer_card_back: { approval_entered_by: @customer_card_back.approval_entered_by, approved_date: @customer_card_back.approved_date, art_id: @customer_card_back.art_id, back_id: @customer_card_back.back_id, card_size_id: @customer_card_back.card_size_id, comments: @customer_card_back.comments, customer_approved_by: @customer_card_back.customer_approved_by, customer_number: @customer_card_back.customer_number, family_id: @customer_card_back.family_id, job_id: @customer_card_back.job_id, plate_id: @customer_card_back.plate_id, print_seq_id: @customer_card_back.print_seq_id } }
    end

    assert_redirected_to customer_card_back_url(CustomerCardBack.last)
  end

  test "should show customer_card_back" do
    get customer_card_back_url(@customer_card_back)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_card_back_url(@customer_card_back)
    assert_response :success
  end

  test "should update customer_card_back" do
    patch customer_card_back_url(@customer_card_back), params: { customer_card_back: { approval_entered_by: @customer_card_back.approval_entered_by, approved_date: @customer_card_back.approved_date, art_id: @customer_card_back.art_id, back_id: @customer_card_back.back_id, card_size_id: @customer_card_back.card_size_id, comments: @customer_card_back.comments, customer_approved_by: @customer_card_back.customer_approved_by, customer_number: @customer_card_back.customer_number, family_id: @customer_card_back.family_id, job_id: @customer_card_back.job_id, plate_id: @customer_card_back.plate_id, print_seq_id: @customer_card_back.print_seq_id } }
    assert_redirected_to customer_card_back_url(@customer_card_back)
  end

  test "should destroy customer_card_back" do
    assert_difference('CustomerCardBack.count', -1) do
      delete customer_card_back_url(@customer_card_back)
    end

    assert_redirected_to customer_card_backs_url
  end
end
