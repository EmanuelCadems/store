class LineItemsController < ApplicationController

  def create
    item       = Item.find(params[:item_id])
    @line_item = @cart.add_item(item.id)

    if @line_item.save
      redirect_to cart_path(@line_item.cart), notice: "Product added to your cart"
    else
      render 'items/index'
    end
  end

protected
  def line_item_params
    params.require(:line_item).permit(:item_id)
  end
end
