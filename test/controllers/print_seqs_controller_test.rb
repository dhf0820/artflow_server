require 'test_helper'

class PrintSeqsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @print_seq = print_seqs(:one)
  end

  test "should get index" do
    get print_seqs_url
    assert_response :success
  end

  test "should get new" do
    get new_print_seq_url
    assert_response :success
  end

  test "should create print_seq" do
    assert_difference('PrintSeq.count') do
      post print_seqs_url, params: { print_seq: { desc: @print_seq.desc, name: @print_seq.name } }
    end

    assert_redirected_to print_seq_url(PrintSeq.last)
  end

  test "should show print_seq" do
    get print_seq_url(@print_seq)
    assert_response :success
  end

  test "should get edit" do
    get edit_print_seq_url(@print_seq)
    assert_response :success
  end

  test "should update print_seq" do
    patch print_seq_url(@print_seq), params: { print_seq: { desc: @print_seq.desc, name: @print_seq.name } }
    assert_redirected_to print_seq_url(@print_seq)
  end

  test "should destroy print_seq" do
    assert_difference('PrintSeq.count', -1) do
      delete print_seq_url(@print_seq)
    end

    assert_redirected_to print_seqs_url
  end
end
