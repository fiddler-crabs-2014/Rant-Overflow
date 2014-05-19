class UsersController < ApplicationController

  # do I need this?
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to :show
    else
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to :index
    else
      render :edit
    end
  end

  def login
    @user = User.new
  end

  # move/share with sessions
  def do_login
    @user = User.authenticate(params[:email], params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to user_profile_path
    else
      session[:user_id] = nil
      redirect_to login_path
    end
  end

  # what's the diff between profile and show
  def profile
    # if session[:user_id].nil?
    #   @user = nil
    # else
    #    @user = User.find(session[:user_id])
    # end
    @user = current_user

    if @user
      render :show
    else
      redirect_to :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :login
  end

  private

  def user_params
    params.required(:user).permit(:email,:password)
  end


end
