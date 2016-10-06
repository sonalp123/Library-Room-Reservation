class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :admdel, :memsdel, :update]
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

  def editprof
    @user = User.new
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
  end

  def memsview
    @user = User.new
  end

  def admincreation
    @user = User.new
  end

  def adminupdate
    @user = User.find_by_username(params[:user][:username])
    respond_to do |format|
      if @user.update_attribute(:role, 'admin') or @user.update_attribute(:role, 'user')
        format.html { redirect_to dum_path, notice: 'Updated successfully'}
      else
          format.html { redirect_to admincreation_path }
       end
    end
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
        flash[:notice] = "#{session[:username]} User was successfully created."
        if session[:user_role] == 'admin'
          format.html {redirect_to dum_path}
          else
            format.html {redirect_to root_path}
            end
        #format.json { render :dum, status: :created, location: @user }
      else
        format.html { render :root }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@user_update = User.new(user_params)
    #@user = User.all.select {|u| u.username == params[:username]}
    #@user = User.find_by_username(params[:user][:username])
    #@user.(user_params)
    #@user.username = session[:user_name]
    #@user = User.find_by_username(params[:user][:username])
    respond_to do |format|
      if @currentuser.username != "Superadmin"
        if @currentuser.update(user_params)
        flash[:success]="Profile updated"
        if @currentuser.role == "admin"
          format.html { redirect_to dum_url, notice: 'User was successfully updated.' }
        else
          format.html { redirect_to booking_histories_url, notice: 'User was successfully updated.' }
        end
      else
        flash[:notice]="Profile couldn't be updated. Please try again"
        format.html { redirect_to booking_histories_url }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
        end
        else
        format.html { redirect_to dum_url, notice: 'Superadmin cannot be updated.'}
        end
      end
  end
  def checkexitinguser
    @user = User.find(params[:id])
    if (@user != null)
      flash[:notice]="User does not exist. Please sign up"
    else
      flash[:notice]="Please enter password"
    end
  end

  def destroy
      @userdel = User.find_by_username(params[:user][:username])
      respond_to do |format|
      if (@userdel.username != session[:user_name]) and (@userdel.username != "Superadmin")
        if @userdel.destroy
          format.html { redirect_to dum_url, notice: 'User was successfully deleted.' }
          format.json { head :no_content }
          end
        else
          format.html { redirect_to dum_url, notice: 'User cannot be deleted.' }
      end
    end
  end

  def set_user
      @currentuser = User.find_by_username(session[:user_name])
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