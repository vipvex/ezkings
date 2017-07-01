require 'test_helper'

class CardManufacturerCardsControllerTest < ActionController::TestCase
  setup do
    @card_manufacturer_card = card_manufacturer_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_manufacturer_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_manufacturer_card" do
    assert_difference('CardManufacturerCard.count') do
      post :create, card_manufacturer_card: { card_id: @card_manufacturer_card.card_id, card_manufacturer_id: @card_manufacturer_card.card_manufacturer_id }
    end

    assert_redirected_to card_manufacturer_card_path(assigns(:card_manufacturer_card))
  end

  test "should show card_manufacturer_card" do
    get :show, id: @card_manufacturer_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_manufacturer_card
    assert_response :success
  end

  test "should update card_manufacturer_card" do
    patch :update, id: @card_manufacturer_card, card_manufacturer_card: { card_id: @card_manufacturer_card.card_id, card_manufacturer_id: @card_manufacturer_card.card_manufacturer_id }
    assert_redirected_to card_manufacturer_card_path(assigns(:card_manufacturer_card))
  end

  test "should destroy card_manufacturer_card" do
    assert_difference('CardManufacturerCard.count', -1) do
      delete :destroy, id: @card_manufacturer_card
    end

    assert_redirected_to card_manufacturer_cards_path
  end
end
