class ProjectsController < ApplicationController

  def index
    @projects = Project.paginate(page: params[:page])
  end

  def show
    @project = Project.find(params[:id])
  end

  def import
    Material.import(params[:file])
    #redirect_to link_to project.name, project, notice: "Employee Project Data Imported!"
  end

end
