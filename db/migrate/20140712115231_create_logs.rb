class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :alien_id
      t.integer :product_id
      t.integer :destination_id
      t.string :stage
      t.date :created_date
      t.date :close_date
      t.boolean :closed
      t.decimal :setup_charge, :precision => 10, :scale => 1
      t.decimal :revenue_month, :precision => 10, :scale => 1 , :null => false, :default => 0

      t.timestamps
    end
  end
end
