require 'test_helper'

class LibraryRoomsControllerTest < ActionController::TestCase
  setup do
    @library_room = library_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:library_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create library_room" do
    assert_difference('LibraryRoom.count') do
      post :create, library_room: { building: @library_room.building, number: @library_room.number, size: @library_room.size }
    end

    assert_redirected_to library_room_path(assigns(:library_room))
  end

  test "should show library_room" do
    get :show, id: @library_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @library_room
    assert_response :success
  end

  test "should update library_room" do
    patch :update, id: @library_room, library_room: { building: @library_room.building, number: @library_room.number, size: @library_room.size }
    assert_redirected_to library_room_path(assigns(:library_room))
  end

  test "should destroy library_room" do
    assert_difference('LibraryRoom.count', -1) do
      delete :destroy, id: @library_room
    end

    assert_redirected_to library_rooms_path
  end
end
