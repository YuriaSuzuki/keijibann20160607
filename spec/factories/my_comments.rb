FactoryGirl.define do
  factory :my_comment do
    id 1
    title { Faker::Commerce.color }
    created_at 2016-06-05
    updated_at 2016-06-05
    user_id 1

   factory :invalid_my_comment do
     title nil
   end
  end
end
