class SessionsController < ApplicationController
  def new
  end
  def create
  	user = User.find_by_email(params[:email])
  	if user
	  	if user.authenticate(params[:password])
	  		session[:user_id] = user.id
	  		redirect_to '/users'
	  	else
	  		flash[:errors] = ['Invalid password']
	  		redirect_to "/sessions/new"
	  	end
	else
		flash[:errors] = ['User does not exist']
		redirect_to "/sessions/new"
	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:errors] = ['Come back soon']
  	redirect_to '/sessions/new'
  end
end
