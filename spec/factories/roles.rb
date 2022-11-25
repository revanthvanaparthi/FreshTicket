FactoryBot.define do
  factory :role do
    agent
    sequence(:name) {|n| "Software Engineer - #{n}"}
  end
end
