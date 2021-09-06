FactoryBot.define do
  factory :customer do
    name {"test"}
    address {"兵庫県神戸市中央区加納町１丁目３−１"}
    number {"test_number"}
    assets {"test_assets"}
    memo {"test_memo"}
    association :user, factory: :user
  end
end
