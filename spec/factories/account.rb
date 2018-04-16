FactoryGirl.define do
  factory :account do
  sequence(:account_name) { |n| "Account#{n}"}
  sequence(:user_id) {|n| n }

  end
end
