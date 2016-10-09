class MaterialsController < ApplicationController

  def index
    @materials = Material.select("distinct material", "amount")
  end

  def import
    Material.import(params[:file])
    redirect_to materials_path, notice: "Project Material Data Imported!"
  end

  def get_total_material_amount(material, amount)
    if material.casecmp("Brick") != 0 && material.casecmp("sand") != 0 &&
        material.casecmp("cement") != 0 && material.casecmp("carpet") != 0 && material.casecmp("glass") != 0
      total = amount[/(\d*)\D*/, 1]
    else
      total = amount
    end
    total.to_i
  end

  helper_method :get_total_material_amount
end
