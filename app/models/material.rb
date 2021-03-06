class Material < ActiveRecord::Base

  require 'csv'

  def self.import(file)
    Material.destroy_all

    CSV.foreach(file.path, headers: true) do |row|
      Material.create({project: row[0], material: row[1], amount: row[2] })
    end
  end

end
