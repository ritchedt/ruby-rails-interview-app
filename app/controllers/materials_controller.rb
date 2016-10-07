class MaterialsController < ApplicationController

  def index
    @materials = Material.all
  end

  def import
    Material.import(params[:file])
    redirect_to materials_path, notice: "Project Material Data Imported!"
  end
end
