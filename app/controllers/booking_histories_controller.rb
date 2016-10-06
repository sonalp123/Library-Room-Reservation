class BookingHistoriesController < ApplicationController

  def index
    @booking_histories = BookingHistory.all
  end

  def new
    @booking_history = BookingHistory.new
  end

  def search
    @booking = BookingHistory.new(booking_history_params)
    if params[:booking_history][:room_num]
      @rooms_matching_library =  LibraryRoom.where("library_rooms.number = ?",@booking.room_num )
    #  if @rooms_matching_library.exists?
    #    else
    #      flash[:notice] = "Invalid search."
    #      if session[:user_role] == 'admin'
    #        redirect_to search_booking_history_url
    #        else
    #          redirect_to booking_histories_url
    #      end
    #  end
      @booked_list = BookingHistory.where("booking_histories.room_num = ? AND date = ?",@booking.room_num,@booking.date)
    end
  end

  def show
    @booking_history = BookingHistory.where("booking_histories.username = ?",session[:user_name]).order(:date)
  end

  def addteam
    @booking_history = BookingHistory.where("booking_histories.username = ?",session[:user_name]).order(:date)
  end

  # GET /booking_histories/1/edit
  def edit
  end

  def create
    check = 0
    @booking_history = BookingHistory.new(booking_history_params)
    @room_details = LibraryRoom.find_by_number(@booking_history.room_num)
    if @room_details.nil?
      if session[:user_role] == 'admin'
        flash[:notice] = 'Invalid room details'
        redirect_to new_booking_history_url
      else
        flash[:notice] = 'Invalid room details'
        redirect_to booking_histories_url
      end
    end
    if session[:user_role] == 'admin'
      then
    else
      @booking_history.username = session[:user_name]
    end
    @booking_history.building = @room_details.building
    @booking_history.size = @room_details.size
    @booked_entry = BookingHistory.where("room_num = ? AND date = ?",@booking_history.room_num,@booking_history.date ).order(:start_t)

    @booked_entry.each do |entry|
      if entry != nil
      then

        if (((@booking_history.end_t <= entry.start_t)\
           || (@booking_history.start_t >= entry.end_t))\
           && ((@booking_history.start_t == @booking_history.end_t - 1) || (@booking_history.start_t == @booking_history.end_t - 2 )))
        then
          check = 0
        else
          check = 1
        end
      end
    end



    respond_to do |format|
      if check ==0
        if (@booking_history.save)
          flash[:notice] = "Booking was successfully created. Booking id #{@booking_history.id}"
          if session[:user_role] == 'admin'
            format.html { redirect_to dum_path}
            else
              format.html { redirect_to booking_histories_path}
              end
          # format.json { render :show, status: :created, location: @booking_history }
        else
          flash[:notice] = "Booking failed. Booking id #{@booking_history.id}"
          format.html { redirect_to booking_histories_path }
          # format.json { render json: @booking_history.errors, status: :unprocessable_entity }
        end
      else
        if((@booking_history.start_t == @booking_history.end_t - 1) || (@booking_history.start_t == @booking_history.end_t - 2 ))
          flash[:notice] = "Cannot book for more than 2 hours"
        else
          flash[:notice] = "Booking failed due to time conflict. Booking id #{@booking_history.id}"
        end
        format.html { redirect_to booking_histories_path }
      end

    end
  end


  # PATCH/PUT /booking_histories/1
  # PATCH/PUT /booking_histories/1.json
  def update
    respond_to do |format|
      if @booking_history.update(booking_history_params)
        format.html { redirect_to @booking_history, notice: 'Booking history was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_history }
      else
        format.html { render :edit }
        format.json { render json: @booking_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def bkhist
    @booking_history = BookingHistory.new
  end

  def memshist
    @booking_history = BookingHistory.new(booking_history_params)
  end

  # DELETE /booking_histories/1
  # DELETE /booking_histories/1.json
  def destroy
    @booking_history = BookingHistory.find_by_id(params[:booking_history][:id])
    @booking_history.destroy
    respond_to do |format|
      format.html { redirect_to booking_histories_url, notice: 'Booking history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking_history
    @booking_history = BookingHistory.find(params[:id])
  end

  def viewhist
    @hist_room = BookingHistory.where("room_num = ?",@booking_history.room_num).order(:start_t)
  end

  def bookingdel
    @booking_history = BookingHistory.new
  end

  def deleteexisitingbooking
    @booking_history = BookingHistory.find_by_id(params[:booking_history][:id])
    @booking_history.destroy
    respond_to do |format|
      format.html { redirect_to booking_histories_url, notice: 'Booking history deleted successfully.' }
      format.json { head :no_content }
    end
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_history_params
    params.require(:booking_history).permit(:id, :username, :room_num, :start_t, :end_t, :date, :building, :size)
  end
end

