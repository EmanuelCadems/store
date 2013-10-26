class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.string :name
      t.integer :quantity
      t.float :discount
      t.string :kind

      t.timestamps
    end
  end
end
