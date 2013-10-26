# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    code "MyString"
    name "MyString"
    price 1.5
  end
end
