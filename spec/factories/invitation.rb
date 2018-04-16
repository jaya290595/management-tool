FactoryGirl.define do
  factory :invitation do
  sequence(:email) { |n| n }
  sequence(:account_id) {|n| n}
  sequence(:user_id){|n| n}
  	
  end
end