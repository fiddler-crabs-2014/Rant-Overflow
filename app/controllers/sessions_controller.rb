class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user
      sign_in(user)
      flash[:notice] = "Sign in successful!"
      redirect_to root_path
    else
      flash[:error] = "Wrong username or password!"
      render 'new'
    end
  end

  def destroy
    sign_out
    if session[:user_id].nil?
      flash[:notice] = "Signed out :("
      redirect_to root_url
    end
  end

end
