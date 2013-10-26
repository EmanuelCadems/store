class CartsController < ApplicationController
  before_action :calculate_total, only: [:show]

  expose(:cart)


  def calculate_total
    co = Checkout.new(Promotion.all)
    cart.line_items.each do |line_item|
      (1..line_item.quantity).each { co.scan(line_item.item) }
    end
    @total = co.total
  end

  def destroy
    if cart.destroy
      flash[:notice] = "Cart emptied successfully"
      redirect_to items_path
    end
  end
end
