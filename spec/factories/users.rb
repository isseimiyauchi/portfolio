FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "test123" }
    password_confirmation { "test123" }
    user_name { "test" }

    after(:build) do |message|
      message.avatar.attach(io: File.open('./app/public/images/png.png'), filename: 'png.png')
    end
  end
end
