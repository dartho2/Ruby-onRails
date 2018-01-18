require 'test_helper'

class ProductshipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @productshipment = productshipments(:one)
  end

  test "should get index" do
    get productshipments_url
    assert_response :success
  end

  test "should get new" do
    get new_productshipment_url
    assert_response :success
  end

  test "should create productshipment" do
    assert_difference('Productshipment.count') do
      post productshipments_url, params: { productshipment: {  } }
    end

    assert_redirected_to productshipment_url(Productshipment.last)
  end

  test "should show productshipment" do
    get productshipment_url(@productshipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_productshipment_url(@productshipment)
    assert_response :success
  end

  test "should update productshipment" do
    patch productshipment_url(@productshipment), params: { productshipment: {  } }
    assert_redirected_to productshipment_url(@productshipment)
  end

  test "should destroy productshipment" do
    assert_difference('Productshipment.count', -1) do
      delete productshipment_url(@productshipment)
    end

    assert_redirected_to productshipments_url
  end
end
