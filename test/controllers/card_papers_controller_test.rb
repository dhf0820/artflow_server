require 'test_helper'

class CardPapersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_paper = card_papers(:one)
  end

  test "should get index" do
    get card_papers_url
    assert_response :success
  end

  test "should get new" do
    get new_card_paper_url
    assert_response :success
  end

  test "should create card_paper" do
    assert_difference('CardPaper.count') do
      post card_papers_url, params: { card_paper: { code: @card_paper.code, finish: @card_paper.finish, name: @card_paper.name } }
    end

    assert_redirected_to card_paper_url(CardPaper.last)
  end

  test "should show card_paper" do
    get card_paper_url(@card_paper)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_paper_url(@card_paper)
    assert_response :success
  end

  test "should update card_paper" do
    patch card_paper_url(@card_paper), params: { card_paper: { code: @card_paper.code, finish: @card_paper.finish, name: @card_paper.name } }
    assert_redirected_to card_paper_url(@card_paper)
  end

  test "should destroy card_paper" do
    assert_difference('CardPaper.count', -1) do
      delete card_paper_url(@card_paper)
    end

    assert_redirected_to card_papers_url
  end
end
