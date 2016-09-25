class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :admdel, :memsdel]
  wrap_parameters :user, include: [:username, :email, :password, :password_confirmation, :role]

  # GET /users
  # GET /users.json
  def index
    if :notice.empty?
      flash.now[:notice] = "Welcome #{@user}"
    # @users = User.all
   # @user = User.new(user_params)
   #if params[:commit] == 'Login'
   #  redirect_to dum_path
   #end
    end
    end

  # GET /users/1
  # GET /users/1.json
  def dum
    #flash[:notice] = "hi #{params[:session][:username]}"
  end

  def admdel
    @user = User.new
  end

  def memsdel
    @user = User.new
  end

  def libuser

  end

  def addrooms

  end

  def admview
    @user = User.new
    @admall = User.find_by_role("admin")
  end

  def memsview
    @user = User.new
    @memsall = User.find_by_role("user")
  end

  def memshist
    @user = User.new
   # @memshistall = BookingHistory.find_by_role("username")
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
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.role = 'user'
    respond_to do |format|
      if @user.save!
        sign_in @user
        flash[:notice] = "#{params[:user][:username]} User was successfully created."
        format.html {redirect_to dumget_path}
        #format.json { render :dum, status: :created, location: @user }
      else
        flash[:notice] = "hi"
        format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@user_update = User.new(user_params)
    #@user = User.all.select {|u| u.username == params[:username]}
    #@user = User.find_by_username(params[:user][:username])
    @user = User.find_by_username(params[:user][:username])
    respond_to do |format|
      if @user.update(user_params)
        flash[:success]="Profile updated"
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        flash[:notice]="Profile couldn't be updated. Please try again"
        format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @userdel = User.find_by_username(params[:user][:username])
      if @userdel.destroy
      respond_to do |format|
        format.html { redirect_to dumget_path, notice: 'User was successfully deleted.' }
        format.json { head :no_content }
        end
    end
end
  def set_user
      #@currentuser = User.find(session[:user_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end

  def reset
    reset_session
    redirect_to user_path
  end

  def show
  end

end