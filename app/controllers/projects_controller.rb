class ProjectsController < ApplicationController
  def index
    @id = params[:id]
    @projects = Project.where("user_id = ? AND category_id = ?", session[:user_id], params[:id])
  end

  def create
    project = Project.create(name: params[:name], section: params[:section], amount: params[:amount], user: User.find(session[:user_id]), category: Category.find(params[:category_id]))
    if project.errors.full_messages
      flash[:errors] = project.errors.full_messages
    end
    redirect_to "/projects/index/#{params[:category_id]}"
  end

  def show
    @project = Project.find(params[:id])
    @logs = Log.where("user_id = ? AND project_id = ?", session[:user_id], params[:id])
    @sections = sections(@project.amount)
    percent = @logs.length.to_f/@sections.length * 100
    @percent = percent.round(2)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def new
  end
end
