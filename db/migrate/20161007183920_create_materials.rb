class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :project
      t.string :material
      t.string :amount

      t.timestamps null: false
    end
  end
end
