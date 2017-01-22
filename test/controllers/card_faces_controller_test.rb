require 'test_helper'

class CardFacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_face = card_faces(:one)
  end

  test "should get index" do
    get card_faces_url
    assert_response :success
  end

  test "should get new" do
    get new_card_face_url
    assert_response :success
  end

  test "should create card_face" do
    assert_difference('CardFace.count') do
      post card_faces_url, params: { card_face: { ace_type_id: @card_face.ace_type_id, ad1_type_id: @card_face.ad1_type_id, ad2_type_id: @card_face.ad2_type_id, approved_by: @card_face.approved_by, approved_date: @card_face.approved_date, art_id: @card_face.art_id, card_size_id: @card_face.card_size_id, comments: @card_face.comments, customer_approved_by: @card_face.customer_approved_by, customer_num: @card_face.customer_num, face_id: @card_face.face_id, family_id: @card_face.family_id, hd_color: @card_face.hd_color, is_ace_serial: @card_face.is_ace_serial, is_custom_ta: @card_face.is_custom_ta, job_id: @card_face.job_id, joker1_id: @card_face.joker1_id, joker2_id: @card_face.joker2_id, last_modified_by: @card_face.last_modified_by, m36_id: @card_face.m36_id, m40_id: @card_face.m40_id, plate_id: @card_face.plate_id, print_seq_id: @card_face.print_seq_id } }
    end

    assert_redirected_to card_face_url(CardFace.last)
  end

  test "should show card_face" do
    get card_face_url(@card_face)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_face_url(@card_face)
    assert_response :success
  end

  test "should update card_face" do
    patch card_face_url(@card_face), params: { card_face: { ace_type_id: @card_face.ace_type_id, ad1_type_id: @card_face.ad1_type_id, ad2_type_id: @card_face.ad2_type_id, approved_by: @card_face.approved_by, approved_date: @card_face.approved_date, art_id: @card_face.art_id, card_size_id: @card_face.card_size_id, comments: @card_face.comments, customer_approved_by: @card_face.customer_approved_by, customer_num: @card_face.customer_num, face_id: @card_face.face_id, family_id: @card_face.family_id, hd_color: @card_face.hd_color, is_ace_serial: @card_face.is_ace_serial, is_custom_ta: @card_face.is_custom_ta, job_id: @card_face.job_id, joker1_id: @card_face.joker1_id, joker2_id: @card_face.joker2_id, last_modified_by: @card_face.last_modified_by, m36_id: @card_face.m36_id, m40_id: @card_face.m40_id, plate_id: @card_face.plate_id, print_seq_id: @card_face.print_seq_id } }
    assert_redirected_to card_face_url(@card_face)
  end

  test "should destroy card_face" do
    assert_difference('CardFace.count', -1) do
      delete card_face_url(@card_face)
    end

    assert_redirected_to card_faces_url
  end
end
