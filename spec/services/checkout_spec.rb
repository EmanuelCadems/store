require "spec_helper"

describe Checkout do
  let!(:promotion_2x1) { create(:promotion, quantity:2, discount: 50.0, kind: "Nx1") }
  let!(:promotion_x)   { create(:promotion, quantity:3, discount: 10.0, kind: "%xN") }
  let!(:am)            { create(:item, promotion: promotion_2x1, price: 3.11) }
  let!(:ac)            { create(:item, promotion: promotion_x,   price: 5.0) }
  let!(:ca)            { create(:item, price: 11.23) }

  context "#total" do
    subject { Checkout.new(Promotion.all) }

    context "with promotion 2x1" do
      context "am, ac, am, am, ca" do
        it "charges a product every two products" do
          subject.scan(am)
          subject.scan(ac)
          subject.scan(am)
          subject.scan(am)
          subject.scan(ca)
          expect(subject.total.round(2)).to eql(22.45)
        end
      end

      context "am, am" do
        it "charges only one am" do
          subject.scan(am)
          subject.scan(am)

          expect(subject.total).to eql(3.11)
        end
      end

      context "ac, am, am, am" do
        it "charges only one am" do
          subject.scan(ac)
          subject.scan(am)
          subject.scan(am)
          subject.scan(am)

          expect(subject.total).to eql(11.22)
        end
      end
    end

    context "with promotion %xN" do
      context "ac,ac,am,ac" do
        it "reduces the price by 10% every n units" do
          subject.scan(ac)
          subject.scan(ac)
          subject.scan(am)
          subject.scan(ac)

          expect(subject.total).to eql(16.61)
        end
      end
    end
  end
end
