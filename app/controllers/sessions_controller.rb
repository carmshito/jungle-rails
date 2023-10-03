class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if user exists and password entered is correct
    if user && user.authenticate(params[:password])
      # save user id inside the browser cookie to keep user logged in
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.now.alert = "Oops, couldn't log you in. Please make sure you are using a registered email and/or your password is correct and try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
