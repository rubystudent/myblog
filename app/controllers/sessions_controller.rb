class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.token
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_session_path
  end
end
