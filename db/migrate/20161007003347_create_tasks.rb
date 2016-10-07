class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :employee
      t.string :project

      t.timestamps null: false
    end
  end
end
