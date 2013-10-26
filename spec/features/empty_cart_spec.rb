require "spec_helper"

feature "Empty cart" do
  given(:item)             { create(:item) }

  scenario "with many products" do
    item
    visit root_path

    click_on "Add to cart"
    click_on "Empty cart"

    expect(Cart.last.line_items.count).to be_zero
  end
end
