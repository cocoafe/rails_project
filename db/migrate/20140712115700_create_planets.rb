class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :planet_name
      t.integer :galaxy_id

      t.timestamps
    end
  end
end
