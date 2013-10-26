class AddPromotionIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :promotion_id, :integer
  end
end
