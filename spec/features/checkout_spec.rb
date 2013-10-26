require "spec_helper"

feature "Checkout" do
  given!(:promotion_2x1) { create(:promotion, quantity:2, discount: 50.0, kind: "Nx1") }
  given!(:promotion_x)   { create(:promotion, quantity:3, discount: 10.0, kind: "%xN") }
  given(:am)             { create(:item, promotion: promotion_2x1, price: 3.11) }
  given(:ac)             { create(:item, promotion: promotion_x,   price: 5.0) }
  given(:ca)             { create(:item, price: 11.23) }


  scenario "With two products equals from promotion 2x1" do
    am
    visit root_path

    click_on "Add to cart"
    click_on "Continue shopping"
    click_on "Add to cart"

    expect(page).to have_content(am.price)
  end

  scenario "With three products equals from promotion 2x1" do
    am
    visit root_path

    click_on "Add to cart"
    click_on "Continue shopping"
    click_on "Add to cart"
    click_on "Continue shopping"
    click_on "Add to cart"

    expect(page).to have_content(am.price * 2)
  end

  scenario "with three products from promotion discount by 3 or more products" do
    ac
    visit root_path

    (1..2).each {
      click_on "Add to cart"
      click_on "Continue shopping"
    }

    click_on "Add to cart"

    expect(page).to have_content(13.5)
  end
end
