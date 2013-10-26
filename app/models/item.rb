class Item < ActiveRecord::Base
  has_many :line_items
  belongs_to :promotion
  delegate :name, :kind, :quantity, :discount, to: :promotion, prefix: true

  before_destroy :ensure_not_referenced_by_any_line_item

  def ensure_not_referenced_by_any_line_item
    if line_items.any?
      errors.add(:base, "Item is present into line_item")
      return false
    else
      return true
    end
  end
end
