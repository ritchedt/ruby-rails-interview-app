class Task < ActiveRecord::Base

  require 'CSV'

  def self.import(file)
    Task.destroy_all

    CSV.foreach(file.path, headers: true) do |row|
      Task.create({ employee: row[0], project: row[1] })
    end
  end

end
