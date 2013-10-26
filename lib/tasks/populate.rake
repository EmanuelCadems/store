namespace :db do
  desc "TODO"
  task populate: :environment do
    Promotion.destroy_all
    p1 = Promotion.create!(name:'Nx1', quantity: 2, discount: 50.0, name: "Promotion 2 x 1")
    p2 = Promotion.create!(name:'%xN', quantity: 3, discount: 10.0, name: "You have 10 % from 3 units onwards")

    Cart.destroy_all
    Item.destroy_all
    Item.create!(code: 'AM', name: 'Agua mineral', price: 3.11, promotion_id: p1.id)
    Item.create!(code: 'AC', name: 'Aceite',       price: 5.00, promotion_id: p2.id)
    Item.create!(code: 'CA', name: 'Cafe',         price: 11.23)
  end
end
