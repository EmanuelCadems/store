module ApplicationHelper
  def item_has_promotion?(item)
    return item.promotion_name if item.promotion && item.promotion.in?(Promotion.all)
  end

  def active?(a, b)
    return "active" if current_page?(controller: a, action: b)
    ""
  end
end
