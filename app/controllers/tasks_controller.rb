class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def import
    Task.import(params[:file])
    redirect_to tasks_path, notice: "Employee Project Data Imported!"
  end

end
