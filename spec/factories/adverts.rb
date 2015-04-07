FactoryGirl.define do
  factory :advert do
    user nil
    name "MyString"
    description "MyString"
    type 'Sale'
    price "9.99"
  end
end
