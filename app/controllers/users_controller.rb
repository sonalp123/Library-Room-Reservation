class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    flash.now[:notice] = "Welcome #{@user}"
    # @users = User.all
   # @user = User.new(user_params)
   #if params[:commit] == 'Login'
   #  redirect_to dum_path
   #end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def dum
  end

  def admdel
    @user = User.new()
    #@admdel = User.find_by_username(@user.username)
    puts @user
  end

  def admview
    @user = User.new
    @admall = User.find_by_role("admin")
  end

  def admincreation
    @user = User.new
  end
  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        flash[:notice] = 'done'
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user_update = User.new(user_params)
    @user = User.all.select {|u| u.username == params[:username]}
    respond_to do |format|
      if @user.save(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @userdel = User.new(user_params)
    @userdel.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }

  private
    # Use callbacks to share common setup or const
    end
  end

  def set_user
      @user = User.find(session[:user_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
      params.require(:user).permit(:username, :email, :password_hash, :password_salt, :role)
  end

  def reset
    reset_session
    redirect_to user_path
  end
end