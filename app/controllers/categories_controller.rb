class CategoriesController < ApplicationController
  def create
  	category = Category.create(category: params[:category], user: User.find(session[:user_id]))
  	if category.errors.full_messages
      flash[:errors] = category.errors.full_messages
    end  
    redirect_to '/users'
  end
end
