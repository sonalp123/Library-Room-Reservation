require 'test_helper'

class BookingHistoriesControllerTest < ActionController::TestCase
  setup do
    @booking_history = booking_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:booking_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking_history" do
    assert_difference('BookingHistory.count') do
      post :create, booking_history: { booking_id: @booking_history.booking_id, building: @booking_history.building, date: @booking_history.date, end_t: @booking_history.end_t, room_num: @booking_history.room_num, size: @booking_history.size, start_t: @booking_history.start_t, username: @booking_history.username }
    end

    assert_redirected_to booking_history_path(assigns(:booking_history))
  end

  test "should show booking_history" do
    get :show, id: @booking_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking_history
    assert_response :success
  end

  test "should update booking_history" do
    patch :update, id: @booking_history, booking_history: { booking_id: @booking_history.booking_id, building: @booking_history.building, date: @booking_history.date, end_t: @booking_history.end_t, room_num: @booking_history.room_num, size: @booking_history.size, start_t: @booking_history.start_t, username: @booking_history.username }
    assert_redirected_to booking_history_path(assigns(:booking_history))
  end

  test "should destroy booking_history" do
    assert_difference('BookingHistory.count', -1) do
      delete :destroy, id: @booking_history
    end

    assert_redirected_to booking_histories_path
  end
end
