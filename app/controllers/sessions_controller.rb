class SessionsController < ApplicationController
    #session[:user_id] = @user.id
  wrap_parameters :user, include: [:username, :email, :password_hash, :password_salt, :role]

    def new
      @user = User.new
    end

    def create
      @user = User.find_by_email(params[:user][:email])
      #@user = User.new(params[:user])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        #sign_in @user
        redirect_to dumget_path
        flash[:notice] = "Hi #{@current_user}"
      else
        render 'new'
        flash[:error] = 'Invalid email/password combination'
      end
    end

    def logout
      session[:user_id] = nil
      flash[:notice] = "You have successfully logged out."
      redirect_to users_url
    end

    def destroy
    end

  def session_params
    params.require( :user ).permit( :password_salt, :password_hash, :username, :email )
  end
end

