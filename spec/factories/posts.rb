FactoryBot.define do
  factory :post do
    title {"test"}
    detail {"test_text"}
    association :user, factory: :user
  end
end
