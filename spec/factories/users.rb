FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "test123" }
    password_confirmation { "test123" }
    user_name { "test" }

    after(:build) do |user|
      user.avatar.attach(io: File.open('public/images/png.png'), filename: 'png.png')
    end
  end
end
