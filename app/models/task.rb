class Task < ActiveRecord::Base

  require 'CSV'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|

      #task_hash = row.to_hash
      #task = Task.where(employee: task_hash["employee"])

      #if task.count == 1
      #task.first.update_attributes(task_hash)
      #else
      #  Task.create!(task_hash)
      #end
      Task.create(row.to_hash)
    end
  end

  #def self.open_spreadsheet(file)
  #  case File.extname(file.original_filename)
  #   when ".csv" then Roo::Csv.new(file.path, :ignore)
  #   when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  #   when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  #   else raise "Unknown file type: #{file.original_filename}"
  # end
  #end


end
