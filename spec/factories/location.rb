require 'faker'

FactoryGirl.define do
  factory :location do |f|
    f.name { Faker::Address.city }
    f.carrier_id { Faker::Number.digit }
  end
end
