class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :product_family

      t.timestamps
    end
  end
end
