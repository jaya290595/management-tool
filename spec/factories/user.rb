FactoryGirl.define do
  factory :user do
  	name { Faker::Name.name }
    email { Faker::Internet.email }
    password "1234567"
  end
end