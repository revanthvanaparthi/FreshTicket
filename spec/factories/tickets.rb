FactoryBot.define do
  factory :ticket do
    organisation
    agent
    sequence(:title) {|n| "Title#{n}"}
    description {"Description"}
  end
end
