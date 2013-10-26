class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items_with_promotion = []
    @items_without_promotion = []
  end

  def scan(item)
    if item.promotion && item.promotion.in?(@pricing_rules)
      @items_with_promotion << item
    else
      @items_without_promotion << item
    end
  end

  def total
    st1 = @items_without_promotion.inject(0) {|sum, e| sum += e.price }


    calculate_discount + st1
  end

private
  def calculate_discount
    subtotal = 0.0
    @items_with_promotion.uniq.each do |item|
      case item.promotion.name
      when "Nx1"
        quantity_of_item = @items_with_promotion.count(item)
        multiple         = (quantity_of_item / item.promotion.quantity)
        resto            = (quantity_of_item % item.promotion.quantity)
        p "="*100
        p "#{multiple + resto}"
        subtotal        += (multiple + resto)*item.price
      when "%xN"
        quantity_of_item = @items_with_promotion.count(item)

        if quantity_of_item >= item.promotion.quantity
          price = (quantity_of_item * item.price)
          subtotal += price - (price * item.promotion.discount/100.0)
        else
          subtotal += item.price  * quantity_of_item
        end
      else
        subtotal += item.price
      end
    end

    subtotal
  end
end
