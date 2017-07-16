require 'test_helper'

class ShippingOptionsControllerTest < ActionController::TestCase
  setup do
    @shipping_option = shipping_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shipping_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shipping_option" do
    assert_difference('ShippingOption.count') do
      post :create, shipping_option: { name: @shipping_option.name, order: @shipping_option.order, price: @shipping_option.price }
    end

    assert_redirected_to shipping_option_path(assigns(:shipping_option))
  end

  test "should show shipping_option" do
    get :show, id: @shipping_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shipping_option
    assert_response :success
  end

  test "should update shipping_option" do
    patch :update, id: @shipping_option, shipping_option: { name: @shipping_option.name, order: @shipping_option.order, price: @shipping_option.price }
    assert_redirected_to shipping_option_path(assigns(:shipping_option))
  end

  test "should destroy shipping_option" do
    assert_difference('ShippingOption.count', -1) do
      delete :destroy, id: @shipping_option
    end

    assert_redirected_to shipping_options_path
  end
end
