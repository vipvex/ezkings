require 'test_helper'

class CardHighlightsControllerTest < ActionController::TestCase
  setup do
    @card_highlight = card_highlights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:card_highlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create card_highlight" do
    assert_difference('CardHighlight.count') do
      post :create, card_highlight: { card_id: @card_highlight.card_id }
    end

    assert_redirected_to card_highlight_path(assigns(:card_highlight))
  end

  test "should show card_highlight" do
    get :show, id: @card_highlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @card_highlight
    assert_response :success
  end

  test "should update card_highlight" do
    patch :update, id: @card_highlight, card_highlight: { card_id: @card_highlight.card_id }
    assert_redirected_to card_highlight_path(assigns(:card_highlight))
  end

  test "should destroy card_highlight" do
    assert_difference('CardHighlight.count', -1) do
      delete :destroy, id: @card_highlight
    end

    assert_redirected_to card_highlights_path
  end
end
