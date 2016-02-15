require 'faker'

FactoryGirl.define do
  factory :carrier do |f|
    f.name { Faker::Company.name }
    f.user_id { Faker::Number.digit }
  end
end
