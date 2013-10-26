module ApplicationHelper
  def item_has_promotion?(item)
    return item.promotion_name if item.promotion && item.promotion.in?(Promotion.all)
  end
end
