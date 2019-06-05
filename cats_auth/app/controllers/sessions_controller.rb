class SessionsController < ApplicationController

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
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    # todo
    logout!
    # When user logout, redirect to login page
    redirect_to new_session_url
  end
end
