class BookingHistoriesController < ApplicationController
  #before_action :set_booking_history, only: [:show, :edit, :update, :destroy, :search]

  # GET /booking_histories
  # GET /booking_histories.json

  def index
    @booking_histories = BookingHistory.all
  end

  def new
    @booking_history = BookingHistory.new
  end

  def search
    #@booked_list = BookingHistory.where(room_num: params[:room_num])
    @booking = BookingHistory.new(booking_history_params)
    # @booked_list = BookingHistory.all
    # @booked_entry = @booked_list.select do |bh|


    #  bh.room_num == @booking.room_num && bh.date == @booking.date
    if params[:booking_history][:room_num]
      @booked_list = BookingHistory.where("booking_histories.room_num = ? AND date = ?",@booking.room_num,@booking.date)

      #elsif params[:booking_history][:building]
      # elsif @booking.building
      # @booked_list = BookingHistory.joins("LEFT OUTER JOIN library_rooms ON library_rooms.number = booking_histories.room_num")
      #  @booked_list = booked_list_pre.where("booking_histories.building = ? AND date = ?",@booking.building,@booking.date )
      #  @booked_list = BookingHistory.where("booking_histories.building = ? AND date = ?",@booking.building,@booking.date )

      # elsif params[:booking_history][:size]
      # @library = LibraryRoom.new(library: '{#params[:size]}')
      #  @booked_list = BookingHistory.joins("INNER JOIN library_rooms ON library_rooms.number = booking_histories.number").where("booking_histories.size = ? AND date = ?",@booking.size,@booking.date )
      #@booked_list = BookingHistory.where("booking_histories.size = ? AND date = ?",@booking.size,@booking.date )
    end
  end

  # GET /booking_histories/1
  # GET /booking_histories/1.json
  # @return [Object]
  def show
    @booking_history = BookingHistory.find(params[:room_num])
  end


  # GET /booking_histories/new


  # GET /booking_histories/1/edit
  def edit
  end

  # POST /booking_histories
  # POST /booking_histories.json
  def create
    check = 0
    @booking_history = BookingHistory.new(booking_history_params)
    @booking_history =
    # @booked_list = BookingHistory.all
    #@booked_entry = @booked_list.select do |bh|
    # bh.room_num == @booking_history.room_num && bh.date == Date.today + 7.days
    #end
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
          format.html { redirect_to booking_histories_path}
          # format.json { render :show, status: :created, location: @booking_history }
        else
          flash[:notice] = "Booking was failed. Booking id #{@booking_history.id}"
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

  # DELETE /booking_histories/1
  # DELETE /booking_histories/1.json
  def destroy
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_history_params
    params.require(:booking_history).permit(:id, :username, :room_num, :start_t, :end_t, :date, :building, :size)
  end
end

