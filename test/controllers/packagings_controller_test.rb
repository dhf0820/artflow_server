require 'test_helper'

class PackagingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @packaging = packagings(:one)
  end

  test "should get index" do
    get packagings_url
    assert_response :success
  end

  test "should get new" do
    get new_packaging_url
    assert_response :success
  end

  test "should create packaging" do
    assert_difference('Packaging.count') do
      post packagings_url, params: { packaging: { desc: @packaging.desc, item_nmbr: @packaging.item_nmbr, name: @packaging.name } }
    end

    assert_redirected_to packaging_url(Packaging.last)
  end

  test "should show packaging" do
    get packaging_url(@packaging)
    assert_response :success
  end

  test "should get edit" do
    get edit_packaging_url(@packaging)
    assert_response :success
  end

  test "should update packaging" do
    patch packaging_url(@packaging), params: { packaging: { desc: @packaging.desc, item_nmbr: @packaging.item_nmbr, name: @packaging.name } }
    assert_redirected_to packaging_url(@packaging)
  end

  test "should destroy packaging" do
    assert_difference('Packaging.count', -1) do
      delete packaging_url(@packaging)
    end

    assert_redirected_to packagings_url
  end
end
