class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create

    # @user = User.new(name: name, email: email, password: password, password_confirmation: password_confirmation)
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(User.last.id), notice: "Account created. Please log in now."
    else
      flash[:alert] = '"Error creating account: '
      render new_user_path
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
