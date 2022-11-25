FactoryBot.define do
  factory :agent do
    sequence(:name) { |n| "test-#{n}" }
    role_id {1}
    report_to {2}
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@sample.com" }
    password { "123456" }
    # password_confirmation { "123456" }
  end
end
