require 'test_helper'

class ProductStructuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_structure = product_structures(:one)
  end

  test "should get index" do
    get product_structures_url
    assert_response :success
  end

  test "should get new" do
    get new_product_structure_url
    assert_response :success
  end

  test "should create product_structure" do
    assert_difference('ProductStructure.count') do
      post product_structures_url, params: { product_structure: {  } }
    end

    assert_redirected_to product_structure_url(ProductStructure.last)
  end

  test "should show product_structure" do
    get product_structure_url(@product_structure)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_structure_url(@product_structure)
    assert_response :success
  end

  test "should update product_structure" do
    patch product_structure_url(@product_structure), params: { product_structure: {  } }
    assert_redirected_to product_structure_url(@product_structure)
  end

  test "should destroy product_structure" do
    assert_difference('ProductStructure.count', -1) do
      delete product_structure_url(@product_structure)
    end

    assert_redirected_to product_structures_url
  end
end
