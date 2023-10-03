class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    # store all emails in lowercase to avoid case-sensitive login errors:
    user.email.downcase!

    if user.save
      # if user saves in db successfully:
      session[:user_id] = user.id
      redirect_to root_path
    else
      # alert if registration fails
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and your password matches and try again."
      render :new
    end

    

  end   

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
