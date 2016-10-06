class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :employee
      t.string :project

      t.timestamps null: false
    end
  end
end
