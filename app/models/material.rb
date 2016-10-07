class Material < ActiveRecord::Base

  require 'CSV'

  def self.import(file)
    Material.destroy_all

    CSV.foreach(file.path, headers: true) do |row|
      Material.create({project: row[0], materials: row[1], amount: row[2] })
    end
  end

end
