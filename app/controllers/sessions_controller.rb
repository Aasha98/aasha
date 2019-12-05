class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(userparams[:email])
    if user && user.authenticate(userparams[:password]) && user.role=='admin'
      session[:user_type]='admin'
      redirect_to '/users'
    elsif user && user.authenticate(userparams[:password])
      session[:user_type]='user'
      session[:user_id]=user.id
      redirect_to user
    else
      render 'index'
    end
  end

  def destroy
    session[:user_type]=nil
    session[:user_id]=nil
    redirect_to root_path
  end

  private

  def userparams
    params.require(:user).permit(:email,:password)
  end
end
