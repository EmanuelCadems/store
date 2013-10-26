class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  delegate :code, :name, :price, to: :item, prefix: true
  def sub_total
    (quantity * item.price).round(2)
  end
end
