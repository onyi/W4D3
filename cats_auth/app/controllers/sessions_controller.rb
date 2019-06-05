class SessionsController < ApplicationController

  before_action :are_you_logged_in, except: [:destroy]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
        params[:users][:user_name],
        params[:users][:password]
      )
    if @user
      login!(@user)
      redirect_to cats_url
    else
      @user = User.new(user_name: params[:users][:user_name])
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    logout!
    # When user logout, redirect to login page
    redirect_to new_session_url
  end
end
