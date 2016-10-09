class ProjectsController < ApplicationController

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @material = Material.select("distinct project", "material", "amount").where(:project => Project.find(params[:id]).name)
    @task = Task.where(:project => Project.find(params[:id]).name)
  end

end