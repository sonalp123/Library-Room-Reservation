class NotifsController < ApplicationController
  before_action :set_notif, only: [:edit, :update, :destroy]
 wrap_parameters :notif, include: [:username, :sender, :message, :date, :read, :booking_id]

  # GET /notifs
  # GET /notifs.json
  def index
    @notif = Notif.all
  end

  def addteam
    @notif = Notif.new
    @booking_history = BookingHistory.where("booking_histories.username = ?",session[:user_name]).order(:date)
  end

  def newteam
    @notif = Notif.new(notif_params)
    @notif.message = session[:user_name] + ' has booked a room for your meeting!. Booking id is:' + @notif.booking_id.to_s
    @notif.sender = session[:user_name]
    @notif.date = Date.today
    @notif.read = "False"
    respond_to do |format|
      if @notif.save
        format.html { redirect_to booking_histories_path, notice: 'Notif was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /notifs/1
  # GET /notifs/1.json
  def show
    @notif = Notif.find(params[:id])
    @notif.read = 'T'
  end

  # GET /notifs/new
  def new
    @notif = Notif.new
  end

  # GET /notifs/1/edit
  def edit
  end

  # POST /notifs
  # POST /notifs.json
  def create
    @notif = Notif.new(notif_params)
    respond_to do |format|
      if @notif.save
        format.html { redirect_to @notif, notice: 'Notif was successfully created.' }
        format.json { render :show, status: :created, location: @notif }
      else
        format.html { render :new }
        format.json { render json: @notif.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notifs/1
  # PATCH/PUT /notifs/1.json
  def update
    respond_to do |format|
      if @notif.update(notif_params)
        format.html { redirect_to @notif, notice: 'Notif was successfully updated.' }
        format.json { render :show, status: :ok, location: @notif }
      else
        format.html { render :edit }
        format.json { render json: @notif.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifs/1
  # DELETE /notifs/1.json
  def destroy
    @notif.destroy
    respond_to do |format|
      format.html { redirect_to notifs_url, notice: 'Notif was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notif
      @notif = Notif.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notif_params
      params.require(:notif).permit(:username, :message, :date, :sender, :read, :booking_id)
    end
end
