# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :promotion do
    name "MyString"
    quantity 1
    discount 1.5
    kind "MyString"
  end
end
