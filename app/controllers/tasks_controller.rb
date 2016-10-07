class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  #def show
  #  @task = Task.find(params[:id])
  #end

  def import
    Task.import(params[:file])
    redirect_to root_url, notice: "Activity Data Imported!"
  end

end
