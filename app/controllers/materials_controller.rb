class MaterialsController < ApplicationController

  def index
    @materials = Material.all
  end

  def import
    Material.import(params[:file])
  end
end
