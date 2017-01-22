require 'test_helper'

class MfgUnitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mfg_unit = mfg_units(:one)
  end

  test "should get index" do
    get mfg_units_url
    assert_response :success
  end

  test "should get new" do
    get new_mfg_unit_url
    assert_response :success
  end

  test "should create mfg_unit" do
    assert_difference('MfgUnit.count') do
      post mfg_units_url, params: { mfg_unit: { desc: @mfg_unit.desc, dsp_order: @mfg_unit.dsp_order, itsmshnam: @mfg_unit.itsmshnam, name: @mfg_unit.name, pkg_count: @mfg_unit.pkg_count, product_id: @mfg_unit.product_id } }
    end

    assert_redirected_to mfg_unit_url(MfgUnit.last)
  end

  test "should show mfg_unit" do
    get mfg_unit_url(@mfg_unit)
    assert_response :success
  end

  test "should get edit" do
    get edit_mfg_unit_url(@mfg_unit)
    assert_response :success
  end

  test "should update mfg_unit" do
    patch mfg_unit_url(@mfg_unit), params: { mfg_unit: { desc: @mfg_unit.desc, dsp_order: @mfg_unit.dsp_order, itsmshnam: @mfg_unit.itsmshnam, name: @mfg_unit.name, pkg_count: @mfg_unit.pkg_count, product_id: @mfg_unit.product_id } }
    assert_redirected_to mfg_unit_url(@mfg_unit)
  end

  test "should destroy mfg_unit" do
    assert_difference('MfgUnit.count', -1) do
      delete mfg_unit_url(@mfg_unit)
    end

    assert_redirected_to mfg_units_url
  end
end
