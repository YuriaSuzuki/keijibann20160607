FactoryGirl.define do
  factory :user do
    id 1
    username { Faker::Commerce.color }
    email { Faker::Internet.email }
    password 'secret'
    password_confirmation 'secret'
  end
end
