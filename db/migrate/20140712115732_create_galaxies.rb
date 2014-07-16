class CreateGalaxies < ActiveRecord::Migration
  def change
    create_table :galaxies do |t|
      t.string :galaxy_name

      t.timestamps
    end
  end
end
