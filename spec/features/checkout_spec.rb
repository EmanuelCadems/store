require "spec_helper"

feature "Checkout" do
  given(:item) { create(:item, price: 5.0) }

  scenario "sdfd" do
    visit root_path

    click_on "Add to cart"

    expect(page).to have_content(item.price)
    expect(Checkout.last.total_price).to eql(5.0)
  end
end
