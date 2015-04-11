FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person-#{n}@example.com" }
    password 'foobarfoo'
    password_confirmation 'foobarfoo'
    admin false
  end
end
