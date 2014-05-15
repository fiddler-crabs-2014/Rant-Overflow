class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to(:action => 'index')
    else
      render('new')
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
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def login

  end

  def logout
    session[:user_id] = nil
  end

  private

  def user_params
    params.required(:user).permit(:email,:password)
  end


end
