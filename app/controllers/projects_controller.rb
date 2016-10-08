class ProjectsController < ApplicationController

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
    @material = Material.where(:project => Project.find(params[:id]).name)
  end

end