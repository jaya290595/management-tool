FactoryGirl.define do
  factory :team_member do
  sequence(:team_id) { |n| "Team#{n}"}
  sequence(:user_id) {|n| "user#{n}" }

  end
end