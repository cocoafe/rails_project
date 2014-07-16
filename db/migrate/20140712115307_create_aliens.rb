class CreateAliens < ActiveRecord::Migration
  def change
    create_table :aliens do |t|
      t.string :alien_name
      t.integer :category_id
      t.timestamps
    end
  end
end
