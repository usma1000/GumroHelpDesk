require 'faker'

FactoryGirl.define do
  factory :store do |f|
    f.store { Faker::Number.number(4) }
    f.location_id { Faker::Number.digit }
  end
end
