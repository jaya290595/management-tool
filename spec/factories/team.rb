FactoryGirl.define do
  factory :team do
  sequence(:team_name) { |n| "Team#{n}"}
  sequence(:account_id) {|n| n }
  sequence(:owner_id) {|n| n }

  end
end