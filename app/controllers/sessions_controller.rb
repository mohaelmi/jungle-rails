class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:user][:email], params[:user][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end


end
