require 'test_helper'

class CardManufacturersControllerTest < ActionController::TestCase
  setup do
    @card_manufacturer = card_manufacturers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_manufacturers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_manufacturer" do
    assert_difference('CardManufacturer.count') do
      post :create, card_manufacturer: { name: @card_manufacturer.name }
    end

    assert_redirected_to card_manufacturer_path(assigns(:card_manufacturer))
  end

  test "should show card_manufacturer" do
    get :show, id: @card_manufacturer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_manufacturer
    assert_response :success
  end

  test "should update card_manufacturer" do
    patch :update, id: @card_manufacturer, card_manufacturer: { name: @card_manufacturer.name }
    assert_redirected_to card_manufacturer_path(assigns(:card_manufacturer))
  end

  test "should destroy card_manufacturer" do
    assert_difference('CardManufacturer.count', -1) do
      delete :destroy, id: @card_manufacturer
    end

    assert_redirected_to card_manufacturers_path
  end
end
