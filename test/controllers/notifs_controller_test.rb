require 'test_helper'

class NotifsControllerTest < ActionController::TestCase
  setup do
    @notif = notifs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notifs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notif" do
    assert_difference('Notif.count') do
      post :create, notif: { date: @notif.date, message: @notif.message, read: @notif.read, sender: @notif.sender, username: @notif.username }
    end

    assert_redirected_to notif_path(assigns(:notif))
  end

  test "should show notif" do
    get :show, id: @notif
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notif
    assert_response :success
  end

  test "should update notif" do
    patch :update, id: @notif, notif: { date: @notif.date, message: @notif.message, read: @notif.read, sender: @notif.sender, username: @notif.username }
    assert_redirected_to notif_path(assigns(:notif))
  end

  test "should destroy notif" do
    assert_difference('Notif.count', -1) do
      delete :destroy, id: @notif
    end

    assert_redirected_to notifs_path
  end
end
