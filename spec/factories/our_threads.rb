FactoryGirl.define do
  factory :our_thread do
    id 10
    title { Faker::Commerce.color }
    created_at 2016-06-05
    updated_at 2016-06-05
    user_id 1

   factory :invalid_our_thread do
     title nil
   end
  end
end
