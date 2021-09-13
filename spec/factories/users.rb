FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "test123" }
    password_confirmation { "test123" }
    user_name { "test" }

   after(:build) do |user|
      user.avatar.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end

  end
end
