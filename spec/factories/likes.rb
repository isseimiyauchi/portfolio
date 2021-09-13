FactoryBot.define do
  factory :like do
    association :post, factory: :post
    association :user, factory: :user
    image_url { Faker::File.file_name('path/to') }
  end
end
