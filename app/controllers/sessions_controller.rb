class SessionsController < ApplicationController
  def new
  end

  def create
    # http://railscasts.com/episodes/250-authentication-from-scratch
    # https://gist.github.com/thebucknerlife/10090014
    @user = User.find_by_email(params[:session][:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:session][:password])

    # if user
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, " + @user.email + "!"
      redirect_to statuses_path
    else
      # If user's login doesn't work, send them back to the login form.
      flash[:alert] = "Please log in again"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
