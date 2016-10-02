class LibraryRoomsController < ApplicationController
  before_action :set_library_room, only: [:show, :edit, :update, :destroy]

  # GET /library_rooms
  # GET /library_rooms.json
  def index
    @library_rooms = LibraryRoom.all
  end

  # GET /library_rooms/1
  # GET /library_rooms/1.json
  def show
  end

  # GET /library_rooms/new
  def new
    @library_room = LibraryRoom.new
  end

  # GET /library_rooms/1/edit
  def edit
  end

  # POST /library_rooms
  # POST /library_rooms.json
  def create
    @library_room = LibraryRoom.new(library_room_params)
    if @library_room.number > 0
    respond_to do |format|
      if @library_room.save
        format.html { redirect_to @library_room, notice: 'Library room was successfully created.' }
        format.json { render :show, status: :created, location: @library_room }
      else
        format.html { redirect_to @library_room, notice: 'Library room failed.' }
        format.json { render json: @library_room.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /library_rooms/1
  # PATCH/PUT /library_rooms/1.json
  def update
    respond_to do |format|
      if @library_room.update(library_room_params)
        format.html { redirect_to @library_room, notice: 'Library room was successfully updated.' }
        format.json { render :show, status: :ok, location: @library_room }
      else
        format.html { render :edit }
        format.json { render json: @library_room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @library_room.destroy
    respond_to do |format|
      format.html { redirect_to library_rooms_url, notice: 'Library room was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_library_room
    @library_room = LibraryRoom.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def library_room_params
    params.require(:library_room).permit(:number, :building, :size)
  end
end
