FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "test123" }
    password_confirmation { "test123" }
  end
end
