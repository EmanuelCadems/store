require 'spec_helper'

describe Item do
  let(:item)      { create(:item) }
  let(:line_item) { create(:line_item) }
  describe "validations" do
    describe "ensure_not_referenced_by_any_line_item" do
      context "with an item present into line_item" do
        subject { line_item.item }

        it "has errors" do
          subject.destroy
          expect(subject).to have_at_most(1).errors_on(:base)
        end
      end

      context "with an item do not present into line_item" do
        subject { item }

        it "has errors" do
          subject.destroy
          expect(subject).to have_at_least(0).errors
        end
      end
    end
  end
end
