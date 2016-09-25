class SessionsController < ApplicationController
  wrap_parameters :user, include: [:username, :email, :password, :password_confirmation, :role]

    def new
      @user = User.new
    end

    def create
      @user = User.find_by_email(params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        flash[:notice] = "You logged in"
        session[:user_id] = @user.id
        session[:user_name] = @user.username
        if @user.role == 'admin'
          redirect_to dumget_path
        else
          redirect_to booking_histories_path
        end
      else
        render 'new'
        flash[:notice] = 'Invalid email/password combination'
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
    params.require(:user).permit( :password, :password_confirmation, :username, :email )
  end
end