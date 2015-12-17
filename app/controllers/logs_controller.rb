class LogsController < ApplicationController
  def index
  end

  def create
  	log = Log.create(user: User.find(session[:user_id]), project: Project.find(params[:project_id]), number: params[:number])
  	@project = Project.find(params[:project_id])
    @logs = Log.where("user_id = ? AND project_id = ?", session[:user_id], params[:project_id])
    @sections = sections(@project.amount)
    percent = @logs.length.to_f/@sections.length * 100
    @percent = percent.round(2)
    render :json => { "percent": @percent}
  end

  def destroy
  	@log = Log.where("number = ? AND user_id = ? AND project_id =?", params[:num], session[:user_id], params[:project_id]).pluck('id').join
    Log.destroy(@log)
    @project = Project.find(params[:project_id])
    @logs = Log.where("user_id = ? AND project_id = ?", session[:user_id], params[:project_id])
    @sections = sections(@project.amount)
    percent = @logs.length.to_f/@sections.length * 100
    @percent = percent.round(2)
    render :json => { "percent": @percent}
  end

  def new
  end
end
