class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def sub_total
    quantity * item.price
  end
end
