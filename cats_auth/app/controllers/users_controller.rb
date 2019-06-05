class UsersController < ApplicationController

  before_action :are_you_logged_in, except: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      login!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end

  end


  private
  def user_params
    params.require(:users).permit(:user_name, :password)
  end

end
