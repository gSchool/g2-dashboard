class SessionsController < ApplicationController
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def new

  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Login Successful"
      redirect_to root_url
    else
      flash.now[:error] = "Incorrect login, try again"
      render "new"
    end
  end
end