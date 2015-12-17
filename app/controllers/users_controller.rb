class UsersController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @categories = Category.where(:user_id => [@user.id, 1])
    @projects = Project.where("user_id = ?", session[:user_id])
  end
  
  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.errors.full_messages.empty?
      session[:user_id] = user.id
      redirect_to '/users'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/sessions/new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
