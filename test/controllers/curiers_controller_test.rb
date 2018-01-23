require 'test_helper'

class CuriersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @curier = curiers(:one)
  end

  test "should get index" do
    get curiers_url
    assert_response :success
  end

  test "should get new" do
    get new_curier_url
    assert_response :success
  end

  test "should create curier" do
    assert_difference('Curier.count') do
      post curiers_url, params: { curier: {  } }
    end

    assert_redirected_to curier_url(Curier.last)
  end

  test "should show curier" do
    get curier_url(@curier)
    assert_response :success
  end

  test "should get edit" do
    get edit_curier_url(@curier)
    assert_response :success
  end

  test "should update curier" do
    patch curier_url(@curier), params: { curier: {  } }
    assert_redirected_to curier_url(@curier)
  end

  test "should destroy curier" do
    assert_difference('Curier.count', -1) do
      delete curier_url(@curier)
    end

    assert_redirected_to curiers_url
  end
end
